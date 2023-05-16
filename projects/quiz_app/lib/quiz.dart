import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/screens/start_screen.dart';
import 'package:quiz_app/screens/question_screen.dart';
import 'package:quiz_app/screens/results_screen.dart';
import 'package:quiz_app/logPages/login_screen.dart';
import 'package:quiz_app/logPages/logup_screen.dart';
import 'package:quiz_app/screens/match_screen.dart';

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
  List<String> selectedAnswersHelp = [];

  @override
  void initState() {
    // TODO: implement initState

    activeScreen = LogInScreen(logUpScreenUp, startScreen);
    super.initState();
  }

  void matchScreenUp() {
    setState(() {
      activeScreen = MatchScreen(backToResults);
    });
  }

  void backToResults() {
    print(selectedAnswersHelp);
    setState(() {
      activeScreen =
          ResulesScreen(selectedAnswersHelp, homeScreen, matchScreenUp);
    });
  }

  void logUpScreenUp() {
    setState(() {
      activeScreen = LogUpScreen(startScreen);
    });
  }

  void startScreen() {
    setState(() {
      print("start");
      activeScreen = StartScreen(switchScreen);
    });
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
        activeScreen =
            ResulesScreen(selectedAnswers, homeScreen, matchScreenUp);
        selectedAnswersHelp = selectedAnswers;
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
