import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tips_viewer/models/isar/isar.dart';

const dartRepoUrl =
    'https://api.github.com/repos/vandadnp/flutter-tips-and-tricks/contents/tipsandtricks';
const rustRepoUrl =
    'https://api.github.com/repos/vandadnp/rust-tips-and-tricks/contents/images';

class AppSetupService {}

class AppSetupStateProvider extends StateNotifier<AppState> {
  final AppSetupService setupService;

  AppSetupStateProvider(this.setupService)
      : super(AppState(
          appTitle: 'Flutter',
          repoUrl: dartRepoUrl,
        ));

  void initialize() async {
    final dir = await getApplicationSupportDirectory();

    final isar = await Isar.open(
      schemas: [PostIsarSchema],
      directory: dir.path,
      inspector: true, // if you want to enable the inspector for debug builds
    );

    state = state.copyWith(
      appTitle: 'Flutter Tips & Tricks',
      isar: isar,
    );
  }

  void setRepoUrl(String repo) {
    state = state.copyWith(repoUrl: repo);
  }

  void setToken(String token) {}
}

class AppState {
  final String appTitle;
  final String? githubToken;
  final String repoUrl;
  final Isar? isar;

  AppState({
    required this.appTitle,
    this.githubToken,
    required this.repoUrl,
    this.isar,
  });
  AppState.empty({
    this.appTitle = '',
    this.githubToken,
    this.repoUrl = '',
  }) : isar = null;

  AppState copyWith({
    String? appTitle,
    String? githubToken,
    String? repoUrl,
    Isar? isar,
  }) {
    return AppState(
      appTitle: appTitle ?? this.appTitle,
      githubToken: githubToken ?? this.githubToken,
      repoUrl: repoUrl ?? this.repoUrl,
      isar: isar ?? this.isar,
    );
  }
}
