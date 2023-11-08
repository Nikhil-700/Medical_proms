import 'package:flutter/material.dart';
import 'package:scmia_eprom/constants.dart';

class PasswordTextInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  const PasswordTextInput(
      {super.key, required this.controller, required this.hintText});

  @override
  State<PasswordTextInput> createState() => _PasswordTextInputState();
}

class _PasswordTextInputState extends State<PasswordTextInput> {
  bool _passwordVisible = false;
  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: question_style,
      controller: widget.controller,
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          color: Colors.black,
          padding: EdgeInsets.only(right: 18),
          icon: Icon(
            // Based on passwordVisible state choose the icon
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: theme_dark,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
        contentPadding: const EdgeInsets.all(21),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        border: const OutlineInputBorder(),
        hintText: widget.hintText,
        hintStyle: question_style,
      ),
    );
  }
}
