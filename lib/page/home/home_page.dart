import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tips_viewer/models/filter.dart';
import 'package:tips_viewer/page/home/parts/list_data_part.dart';
import 'package:tips_viewer/page/home/screens/mobile.dart';
import 'package:tips_viewer/page/home/screens/web.dart';
import 'package:tips_viewer/providers/providers.dart';
import 'package:tips_viewer/services/app_setup_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid || Platform.isIOS) {
      return const HomePageMobile(
        child: HomePageContent(),
      );
    }
    return const HomePageWeb(
      child: HomePageContent(),
    );
  }
}

class HomePageContent extends ConsumerStatefulWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends ConsumerState<HomePageContent> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(postsInserter);
    ref.watch(restoreGithubToken);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 4),
            child: SearchWidget(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 4,
          ),
          child: Column(
            children: [
              SizedBox(
                width: 200,
                child: CupertinoSegmentedControl(
                  groupValue: ref.watch(tab),
                  children: const {
                    'dart': Text('Dart'),
                    'rust': Text('Rust'),
                  },
                  onValueChanged: (String value) {
                    ref.read(tab.notifier).update((state) => value);

                    if (value == 'dart') {
                      ref
                          .read(appSetupProvider.notifier)
                          .setRepoUrl(dartRepoUrl);
                    } else if (value == 'rust') {
                      ref
                          .read(appSetupProvider.notifier)
                          .setRepoUrl(rustRepoUrl);
                    }
                  },
                ),
              ),
              const DataWidget(),
            ],
          ),
        )
      ],
    );
  }
}

class SearchWidget extends ConsumerWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final controller = TextEditingController();

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: 'Search..',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
            onPressed: () {
              controller.clear();
              ref
                  .read(filterProvider.notifier)
                  .update((state) => Filter(keyword: ''));
            },
            icon: const Icon(Icons.close)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.transparent,
            style: BorderStyle.none,
            width: 0,
          ),
        ),
      ),
      onChanged: (value) => ref
          .read(filterProvider.notifier)
          .update((state) => Filter(keyword: value)),
    );
  }
}
