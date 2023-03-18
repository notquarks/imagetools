import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagetools/providers/data_provider.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final apiToken = ref.watch(apiTokenProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('API Token'),
            subtitle: Text(
                apiToken == null || apiToken.isEmpty ? 'Not set' : apiToken),
            onTap: () {
              _showApiTokenDialog(context);
            },
          )
        ],
      ),
    );
  }

  void _showApiTokenDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newToken = '';
        return AlertDialog(
          title: Text('Enter API Token'),
          content: TextField(
            onChanged: (value) {
              newToken = value;
            },
            decoration: InputDecoration(
              hintText: 'Enter your API token here',
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () async {
                await ref
                    .read(apiTokenProvider.notifier)
                    .saveApiToken(newToken);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
