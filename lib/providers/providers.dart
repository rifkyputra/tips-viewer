import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tips_viewer/models/filter.dart';
import 'package:tips_viewer/services/app_setup_service.dart';
import 'package:tips_viewer/services/github_service.dart';

const COMMITS_URL_PATH_PREFIX = '$dartRepoUrl/commits?path=';

final githubProvider = Provider<GithubService>((_) => GithubService(Dio()));

final listFromApi = FutureProvider<List>(
  (ref) async {
    final appSetup = ref.watch(appSetupProvider);
    final api = ref.watch(githubProvider);

    return await api.get<List>(url: appSetup.repoUrl);
  },
);

final getCommitsInfo = FutureProvider.family((ref, String path) {
  final api = ref.watch(githubProvider);

  return api.get(url: '$COMMITS_URL_PATH_PREFIX$path');
});

final listContent = StateProvider<List<Map>>(
  (ref) {
    final filter = ref.watch(filterProvider);

    final List content = ref.watch(listFromApi).asData?.value ?? [];
    final data = List<Map>.from(
        content.where((element) => element['name'].contains(filter.keyword)));

    return data;
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
