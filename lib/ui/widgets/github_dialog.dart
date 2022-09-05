import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tips_viewer/providers/providers.dart';
import 'package:url_launcher/url_launcher.dart';

class GithubDialog extends ConsumerStatefulWidget {
  const GithubDialog({super.key});

  @override
  ConsumerState<GithubDialog> createState() => _ApaayaState();
}

class _ApaayaState extends ConsumerState<GithubDialog> {
  String token = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                  await launchUrl(
                      Uri.parse('https://github.com/settings/tokens/'));
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
        ),
      ),
    );
  }
}
