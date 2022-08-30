import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reference_explorer/providers/providers.dart';

class HomePageMobile extends ConsumerWidget {
  const HomePageMobile({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ref.watch(appSetupProvider).appTitle),
        centerTitle: true,
      ),
      body: child,
    );
  }
}
