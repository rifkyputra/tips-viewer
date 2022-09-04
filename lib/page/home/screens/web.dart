import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tips_viewer/providers/providers.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageWeb extends ConsumerWidget {
  const HomePageWeb({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          NavigationRail(
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person),
                label: Text('Auth'),
              ),
            ],
            selectedIndex: 0,
            onDestinationSelected: (value) {
              if (value == 1) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: Apaaya(),
                    );
                  },
                );
              }
            },
          ),
          const SizedBox(width: 20),
          Expanded(
            // width: 600,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 40),
                  Center(
                    child: Title(
                      color: Theme.of(context)
                              .primaryTextTheme
                              .titleLarge
                              ?.color ??
                          Colors.black,
                      title: 'Flutter Tips And Tricks',
                      child: Text(
                        'Flutter Tips And Tricks',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  child,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Apaaya extends ConsumerStatefulWidget {
  const Apaaya({super.key});

  @override
  ConsumerState<Apaaya> createState() => _ApaayaState();
}

class _ApaayaState extends ConsumerState<Apaaya> {
  String token = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('your Github token is :'),
                SizedBox(height: 14),
                Text(ref.watch(appSetupProvider).githubToken ?? 'none'),
                SizedBox(height: 24),
              ],
            ),
          ),
          ElevatedButton(
            child: Text('Open Access Token Page'),
            onPressed: () async {
              // intent.Share.
              await launchUrl(Uri.parse('https://github.com/settings/tokens/'));
            },
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                token = value;
              });
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ref.read(appSetupProvider.notifier).setToken(token);
              ref.read(saveToken(token)).when(
                    data: (data) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Success')));
                    },
                    error: (error, stackTrace) {},
                    loading: () {},
                  );
              // Navigator.of(context).pop();
            },
            child: Text('Save'),
          )
        ],
      ),
    );
  }
}
