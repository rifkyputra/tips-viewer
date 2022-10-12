import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tips_viewer/page/detail/detail_page.dart';
import 'package:tips_viewer/providers/providers.dart';

class DataWidget extends ConsumerWidget {
  const DataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final listLocal = ref.watch(listContent).asData?.value;
    final listApi = ref.watch(listFromApi);
    final child = listApi.when(
      data: (_) => null,
      error: (e, s) => null,
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(vertical: 28.0),
        child: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );

    if (child != null) return child;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: listLocal?.length ?? 0,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final data = listLocal![index];

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
