import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tips_viewer/providers/providers.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context, ref) {
    final imageFetchMeta = ref.watch(detailImage(url));

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: imageFetchMeta.when(
                data: (val) {
                  late String imgUrl;
                  if (val is List) {
                    imgUrl = val.firstWhere((element) => element['download_url']
                        .contains('.jpg'))['download_url'];
                  }
                  if (val is Map) {
                    imgUrl = val['download_url'];
                  }
                  return Image.network(
                    imgUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress?.cumulativeBytesLoaded != null &&
                          loadingProgress?.expectedTotalBytes != null) {
                        final percent =
                            loadingProgress!.cumulativeBytesLoaded ~/
                                loadingProgress.expectedTotalBytes!;

                        if (percent < .8) {
                          return const CircularProgressIndicator();
                        }
                      }
                      return child;
                    },
                  );
                },
                error: (_, s) => Text(s.toString()),
                loading: () => const CircularProgressIndicator.adaptive(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
