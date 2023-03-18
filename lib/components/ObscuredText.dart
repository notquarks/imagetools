import 'package:flutter/material.dart';

class ObscuredText extends StatefulWidget {
  final String text;

  ObscuredText({required this.text});

  @override
  _ObscuredTextState createState() => _ObscuredTextState();
}

class _ObscuredTextState extends State<ObscuredText> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _isObscured && widget.text != 'Not set'
                ? widget.text.replaceAllMapped(
                    RegExp(r"."),
                    (match) => "*",
                  )
                : widget.text,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Container(
            // color: Colors.blue,
            child: widget.text != 'Not set'
                ? IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    icon: Icon(
                        _isObscured ? Icons.visibility : Icons.visibility_off),
                    iconSize: 16,
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
