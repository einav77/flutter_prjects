import 'package:flutter/material.dart';
import 'const_contain.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(body: GraidCont([Colors.yellow, Colors.white])),
    ),
  );
}

class Textl extends StatelessWidget {
  const Textl(this.text, {super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 28, color: Colors.blueGrey),
    );
  }
}
