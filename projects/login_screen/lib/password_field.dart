import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final String hintText;
  final void Function(String?) onSaved;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const PasswordTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: _obscureText
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      onSaved: widget.onSaved,
      validator: widget.validator,
    );
  }
}
