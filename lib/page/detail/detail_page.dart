import 'dart:ui';

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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.download),
        onPressed: () {},
      ),
      body: Center(
        child: imageFetchMeta.when(
          data: (val) {
            late String imgUrl;

            if (val is List) {
              imgUrl = val.firstWhere((element) =>
                  element['download_url'].contains('.jpg'))['download_url'];
            }

            if (val is Map) {
              imgUrl = val['download_url'];
            }

            return SizedBox(
              child: DoubleTappableInteractiveViewer(
                scaleDuration: const Duration(milliseconds: 800),
                scale: MediaQuery.of(context).size.aspectRatio < 0.5 ? 3 : 2,
                child: Image.network(
                  imgUrl,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress?.cumulativeBytesLoaded != null &&
                        loadingProgress?.expectedTotalBytes != null) {
                      final percent = loadingProgress!.cumulativeBytesLoaded ~/
                          loadingProgress.expectedTotalBytes!;

                      if (percent < .8) {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }

                    return child;
                  },
                ),
              ),
            );
          },
          error: (_, s) => Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 50),
              const SizedBox(height: 14),
              const Text('Check you Internet Connection'),
              const SizedBox(height: 40),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                          child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(s.toString() * 80),
                            ],
                          ),
                        ),
                      )),
                    );
                  },
                  child: const Text('Debug'))
            ],
          )),
          loading: () => const CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}

class DoubleTappableInteractiveViewer extends StatefulWidget {
  final double scale;
  final Duration scaleDuration;
  final Curve curve;
  final Widget child;
  final GlobalKey? childKey;

  const DoubleTappableInteractiveViewer({
    Key? key,
    this.childKey,
    this.scale = 2,
    this.curve = Curves.fastLinearToSlowEaseIn,
    required this.scaleDuration,
    required this.child,
  }) : super(key: key);

  @override
  State<DoubleTappableInteractiveViewer> createState() =>
      _DoubleTappableInteractiveViewerState();
}

class _DoubleTappableInteractiveViewerState
    extends State<DoubleTappableInteractiveViewer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  Animation<Matrix4>? _zoomAnimation;
  late TransformationController _transformationController;
  TapDownDetails? _doubleTapDetails;
  late GlobalKey _childKey;

  @override
  void initState() {
    super.initState();
    final Size windowSize = MediaQueryData.fromWindow(window).size;
    late Offset screenOffset =
        Offset(windowSize.width / 2, windowSize.height / 2);
    _doubleTapDetails = TapDownDetails(globalPosition: screenOffset);
    _childKey = widget.childKey ?? GlobalKey();
    _transformationController = TransformationController();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.scaleDuration,
    )..addListener(() {
        _transformationController.value = _zoomAnimation!.value;
      });
  }

  @override
  void dispose() {
    _transformationController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _handleDoubleTapDown(TapDownDetails details) {
    _doubleTapDetails = details;
  }

  void _handleDoubleTap() {
    final newValue = _transformationController.value.isIdentity()
        ? _applyZoom()
        : _revertZoom();

    _zoomAnimation = Matrix4Tween(
      begin: _transformationController.value,
      end: newValue,
    ).animate(CurveTween(curve: widget.curve).animate(_animationController));
    _animationController.forward(from: 0);
  }

  Matrix4 _applyZoom() {
    final tapPosition = _doubleTapDetails!.localPosition;
    final translationCorrection = widget.scale - 1;
    final zoomed = Matrix4.identity()
      ..translate(
        -tapPosition.dx * translationCorrection,
        -tapPosition.dy * translationCorrection,
      )
      ..scale(widget.scale);
    return zoomed;
  }

  Matrix4 _revertZoom() => Matrix4.identity();

  Size? get childheight {
    final renderObj = _childKey.currentContext?.findRenderObject();
    if (renderObj == null) return null;
    return (renderObj as RenderBox).size;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onDoubleTapDown: _handleDoubleTapDown,
          onDoubleTap: _handleDoubleTap,
          child: Container(
            color: Colors.black,
            child: LayoutBuilder(builder: (_, cs) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: cs.maxHeight,
                    // height: MediaQuery.of(context).size.height,
                    // width: MediaQuery.of(context).size.width,
                    child: InteractiveViewer(
                      transformationController: _transformationController,
                      child: Stack(children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          bottom: 0,
                          right: 0,
                          child: Container(
                            child: widget.child,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          child: IconButton(
            color: Colors.pink,
            onPressed: () {
              final newValue = _transformationController.value.isIdentity()
                  ? _applyZoom()
                  : _revertZoom();

              _zoomAnimation = Matrix4Tween(
                begin: _transformationController.value,
                end: newValue,
              ).animate(CurveTween(curve: widget.curve)
                  .animate(_animationController));
              _animationController.forward(from: 0);
              // _fullScreen = !_fullScreen;
            },
            icon: const Icon(Icons.fullscreen_rounded),
          ),
        ),
      ],
    );
  }
}
