import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  void initialize() {
    state = state.copyWith(
      appTitle: 'Flutter Tips & Tricks',
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

  AppState({
    required this.appTitle,
    this.githubToken,
    required this.repoUrl,
  });
  AppState.empty({
    this.appTitle = '',
    this.githubToken,
    this.repoUrl = '',
  });

  AppState copyWith({
    String? appTitle,
    String? githubToken,
    String? repoUrl,
  }) {
    return AppState(
      appTitle: appTitle ?? this.appTitle,
      githubToken: githubToken ?? this.githubToken,
      repoUrl: repoUrl ?? this.repoUrl,
    );
  }
}
