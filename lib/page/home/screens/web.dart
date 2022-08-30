import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reference_explorer/providers/providers.dart';

class HomePageWeb extends ConsumerWidget {
  const HomePageWeb({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 40),
          Center(
            child: Title(
              color: Theme.of(context).primaryTextTheme.titleLarge?.color ??
                  Colors.black,
              title: 'Flutter Tips And Tricks',
              child: Text(
                'Flutter Tips And Tricks',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ),
          SizedBox(height: 14),
          child,
        ]),
      ),
    );
  }
}
