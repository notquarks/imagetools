import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagetools/screens/settings.dart';

class PasswordField extends ConsumerStatefulWidget {
  const PasswordField({super.key, this.textController});
  final TextEditingController? textController;
  @override
  ConsumerState<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends ConsumerState<PasswordField> {
  bool _isObscured = true;
  String newToken = '';
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textController,
      obscureText: _isObscured,
      onChanged: (value) {
        newToken = value;
        ref.read(newTokenProvider.notifier).state = newToken;
      },
      decoration: InputDecoration(
        hintText: 'Enter your API token here',
        suffixIcon: IconButton(
          icon: Icon(
            _isObscured ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
        ),
      ),
    );
  }
}
