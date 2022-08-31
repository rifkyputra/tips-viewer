import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reference_explorer/models/filter.dart';
import 'package:reference_explorer/page/home/parts/list_data_part.dart';
import 'package:reference_explorer/page/home/screens/mobile.dart';
import 'package:reference_explorer/page/home/screens/web.dart';
import 'package:reference_explorer/providers/providers.dart';
import 'package:reference_explorer/services/app_setup_service.dart';

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

class HomePageContent extends ConsumerWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return ListView(
      shrinkWrap: true,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 4),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search..',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(26),
                  borderSide: const BorderSide(
                      color: Colors.transparent,
                      style: BorderStyle.none,
                      width: 0),
                ),
              ),
              onChanged: (value) => ref
                  .read(filterProvider.notifier)
                  .update((state) => Filter(keyword: value)),
            ),
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
              ref.watch(listFromApi).when(
                    data: (_) => const SizedBox(),
                    error: (e, s) => Text('Something went wrong $e $s'),
                    loading: () => const Padding(
                      padding: const EdgeInsets.symmetric(vertical: 28.0),
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
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
