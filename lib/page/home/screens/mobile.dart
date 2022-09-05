import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tips_viewer/providers/providers.dart';
import 'package:tips_viewer/ui/widgets/github_dialog.dart';

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
      drawer: Drawer(
        child: SafeArea(
          child: Column(children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Github Token'),
              onTap: () => showDialog(
                context: context,
                builder: (context) => GithubDialog(),
              ),
            ),
          ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            child,
          ],
        ),
      ),
    );
  }
}
