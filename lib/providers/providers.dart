import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tips_viewer/models/filter.dart';
import 'package:tips_viewer/services/app_setup_service.dart';
import 'package:tips_viewer/services/github_service.dart';
import 'package:tips_viewer/models/isar/isar.dart';

const COMMITS_URL_PATH_PREFIX = '$dartRepoUrl/commits?path=';

final githubProvider = Provider<GithubService>((_) => GithubService(Dio()));

final listFromApi = FutureProvider<List>(
  (ref) async {
    final repoUrl = ref.watch(appSetupProvider).repoUrl;
    final api = ref.watch(githubProvider);
    final result = await api.get<List>(url: repoUrl);
    print('### rsult : $result');

    return result;
  },
);

final getCommitsInfo = FutureProvider.family((ref, String path) {
  final api = ref.watch(githubProvider);

  return api.get(url: '$COMMITS_URL_PATH_PREFIX$path');
});

final listContent = StreamProvider<List<PostIsar>>((ref) async* {
  final filter = ref.watch(filterProvider);
  final isar = ref.watch(appSetupProvider).isar;
  final postStream = isar?.postIsars.watchLazy();
  final currentTab = ref.watch(tab);

  // ignore: prefer_function_declarations_over_variables
  final getPost = () async {
    final posts = await isar?.postIsars
        // .buildQuery()
        .filter()
        .typeContains(currentTab)
        .findAll();

    if (posts == null) return null;

    return posts
        .where((element) => element.title.contains(filter.keyword))
        .toList();
  };

  final allPost = (await getPost())?.toList();

  if (allPost != null) yield (List<PostIsar>.from(allPost));

  await for (var _ in postStream!) {
    final list = await getPost();
    if (list == null) continue;

    yield (List<PostIsar>.from(list));
  }
});

final restoreGithubToken = FutureProvider((ref) async {
  final tokenQuery = await ref
      .watch(appSetupProvider)
      .isar
      ?.githubConfigIsars
      .buildQuery<GithubConfigIsar>()
      .findFirst();

  if (tokenQuery == null) return null;

  ref.read(appSetupProvider.notifier).setToken(tokenQuery.token);

  return tokenQuery;
});

final postsInserter = StreamProvider<void>(
  (ref) async* {
    final isar = ref.watch(appSetupProvider).isar;
    final currentTab = ref.watch(tab);
    final content = await ref.watch(listFromApi.future);
    print('#### content : $content');

    if (content.isNotEmpty) {
      isar?.writeTxn((isar) {
        return Future.value([
          for (var element in content)
            isar.postIsars.put(
              SerializePost.fromApi(
                element,
                type: currentTab,
              ),
            )
        ]);
      });
    }
  },
);

final saveToken = FutureProvider.family(
  (ref, String? token) async {
    final isar = ref.watch(appSetupProvider).isar;
    try {
      if (token == null) throw Exception();
      isar?.writeTxn((isar) {
        return isar.githubConfigIsars.put(GithubConfigIsar()..token = token);
      });
      final newToken = await isar?.githubConfigIsars.buildQuery().findFirst();
      return newToken;
    } catch (e) {
      return null;
    }
  },
);

final detailImage = FutureProvider.family(
  (ref, String url) async {
    final api = ref.watch(githubProvider);

    return await api.get(url: url);
  },
);

final appSetupProvider = StateNotifierProvider<AppSetupStateProvider, AppState>(
  (ref) => AppSetupStateProvider(AppSetupService())..initialize(),
);

final filterProvider = StateProvider<Filter>(
  (ref) {
    return Filter();
  },
);

final tab = StateProvider<String>(
  (ref) => 'dart',
);
