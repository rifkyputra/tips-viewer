import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reference_explorer/page/detail/detail_page.dart';
import 'package:reference_explorer/providers/providers.dart';

class DataWidget extends ConsumerWidget {
  const DataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final listData = ref.watch(listContent);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: listData.length,
      itemBuilder: (context, index) {
        // final date = ref.watch(getCommitsInfo(listData[index]['path']));
        final data = listData[index];

        return ListTile(
          onTap: () =>
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return DetailPage(
              url: data['_links']['self'],
            );
          })),
          title: Text(data['name'].toString().replaceAll(
              RegExp(r'(-(?![\s-])|(\.md)|(\.jpg)|(\.jpeg))'), ' ')),
          // trailing: date.when(
          //     data: (data) => Text(data.first['commit']['author']['date']),
          //     error: (_, __) => SizedBox(),
          //     loading: () => CircularProgressIndicator()),
        );
      },
    );
  }
}
