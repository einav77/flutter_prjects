import 'package:flutter/material.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen(this.backTo, {super.key});
  final void Function() backTo;

  @override
  Widget build(BuildContext context) {
    void Function() backTore = backTo;
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'images/quiz-logo.png',
            width: 200,
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 20),
          const Text(
            "this is the info of your match: ",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: () {
              print("fuck");
              backTore();
            },
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            label: const Text(
              "back to reults screen",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
