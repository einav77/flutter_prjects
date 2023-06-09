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
  String ip = '';

  callback(varUsername) {
    setState(() {
      username = varUsername;
      var listToWork = username.split(",");
      username = listToWork[0];
      ip = listToWork[1];
      print("helooooo");
      print(ip);
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
      activeScreen = MatchScreen(backToResults, widget.u1, username, ip);
    });
  }

  void backToResults() {
    print(selectedAnswersHelp);

    setState(() {
      if (selectedAnswersHelp.length > 1) {
        activeScreen = ResulesScreen(
            selectedAnswersHelp, homeScreen, matchScreenUp, username);
      } else {
        activeScreen = StartScreen(switchScreen, matchScreenUp);
      }
    });
  }

  void logUpScreenUp() {
    setState(() {
      activeScreen = LogUpScreen(startScreen, callback);
    });
  }

  void startScreen() {
    setState(() {
      print(ip);
      print("start");
      activeScreen = StartScreen(switchScreen, matchScreenUp);
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
      var _regChannel = IOWebSocketChannel.connect(ip);
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
      activeScreen = StartScreen(switchScreen, matchScreenUp);
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
