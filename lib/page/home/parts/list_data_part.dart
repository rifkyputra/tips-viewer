import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tips_viewer/page/detail/detail_page.dart';
import 'package:tips_viewer/providers/providers.dart';

class DataWidget extends ConsumerWidget {
  const DataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final listData = ref.watch(listContent).asData?.value;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: listData?.length ?? 0,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final data = listData![index];

        return ListTile(
          onTap: () =>
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return DetailPage(
              url: data.link,
            );
          })),
          title: Text(data.title),
        );
      },
    );
  }
}
