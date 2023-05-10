import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    // TODO: implement createState
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    // TODO: implement initState

    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    print(selectedAnswers);
    // ignore_for_file: avoid_print
    //hey
    print(answer);
    print(selectedAnswers.length == questions.length);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResulesScreen(selectedAnswers, homeScreen);
        selectedAnswers = [];
      });
    } else {}
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionPage(homeScreen, chooseAnswer);
    });
  }

  void homeScreen() {
    setState(() {
      activeScreen = StartScreen(switchScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
