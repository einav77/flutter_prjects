import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/screens/start_screen.dart';
import 'package:quiz_app/screens/question_screen.dart';
import 'package:quiz_app/screens/results_screen.dart';
import 'package:quiz_app/logPages/login_screen.dart';
import 'package:quiz_app/logPages/logup_screen.dart';
import 'package:quiz_app/screens/match_screen.dart';
import 'package:quiz_app/user.dart';
import 'package:web_socket_channel/io.dart';

class Quiz extends StatefulWidget {
  user u1 = user('', '', '', '');
  Quiz({super.key});
  State<Quiz> createState() {
    // TODO: implement createState
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];
  List<String> selectedAnswersHelp = [];
  String username = '';

  callback(varUsername) {
    setState(() {
      username = varUsername;
    });
  }

  @override
  void initState() {
    // TODO: implement initState'

    activeScreen = LogInScreen(logUpScreenUp, startScreen, callback);
    super.initState();
  }

  void matchScreenUp() {
    setState(() {
      activeScreen = MatchScreen(backToResults, widget.u1, username);
    });
  }

  void backToResults() {
    print(selectedAnswersHelp);
    setState(() {
      activeScreen = ResulesScreen(
          selectedAnswersHelp, homeScreen, matchScreenUp, username);
    });
  }

  void logUpScreenUp() {
    setState(() {
      activeScreen = LogUpScreen(startScreen, callback);
    });
  }

  void startScreen() {
    setState(() {
      print("start");
      activeScreen = StartScreen(switchScreen);
    });
  }

  void chooseAnswer(String answer) {
    String ansToServer = 'updateans,' + username;
    selectedAnswers.add(answer);
    print(selectedAnswers);
    // ignore_for_file: avoid_print
    //hey
    print(answer);
    print(selectedAnswers.length == questions.length);
    if (selectedAnswers.length == questions.length) {
      for (int i = 0; i < selectedAnswers.length; i++) {
        ansToServer = ansToServer + ',' + selectedAnswers[i];
      }
      var _regChannel = IOWebSocketChannel.connect("ws://10.0.0.1:8820");
      _regChannel.sink.add(ansToServer);

      setState(() {
        activeScreen =
            ResulesScreen(selectedAnswers, homeScreen, matchScreenUp, username);
        selectedAnswersHelp = selectedAnswers;
        selectedAnswers = [];
        print(ansToServer);
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
    print(username);

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
