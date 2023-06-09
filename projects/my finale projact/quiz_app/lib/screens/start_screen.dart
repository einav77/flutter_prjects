import 'package:flutter/material.dart';
import 'package:quiz_app/user.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, this.match, {super.key});
  final void Function() startQuiz;
  final void Function() match;

  @override
  Widget build(BuildContext context) {
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
            "Learn Flutter the fun way ",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            label: const Text(
              "Start Quiz",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: match,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            label: const Text(
              "find my match",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
