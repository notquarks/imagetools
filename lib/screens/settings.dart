import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagetools/components/ObscuredText.dart';
import 'package:imagetools/components/PasswordField.dart';
import 'package:imagetools/providers/data_provider.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

final newTokenProvider = StateProvider<String>((ref) => '');

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final apiToken = ref.watch(apiTokenProvider);
    final apiTextController = TextEditingController(text: apiToken);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('API Token'),
            subtitle: ObscuredText(
                text: apiToken == null || apiToken.isEmpty
                    ? 'Not set'
                    : apiToken),
            onTap: () {
              _showApiTokenDialog(context, apiTextController);
            },
          )
        ],
      ),
    );
  }

  void _showApiTokenDialog(
      BuildContext context, TextEditingController apiTokenController) {
    bool _isObscured = true;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newToken = '';
        return AlertDialog(
          title: Text('Enter API Token'),
          content: PasswordField(
            textController: apiTokenController,
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
                    .saveApiToken(ref.watch(newTokenProvider));
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
