import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tips_viewer/ui/widgets/widgets.dart';

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
                      child: GithubDialog(),
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
