import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final void Function(String text) onSubmit;
  final TextEditingController textControoller;

  CustomTextField(
      {required this.textControoller,
      required this.hintText,
      required this.onSubmit});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: widget.textControoller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              onPressed: () {
                widget.textControoller.clear();
              },
              icon: const Icon(Icons.clear),
            ),
          ),
        ),
      ],
    );
  }
}
