import 'package:flutter/material.dart';
import 'package:login_screen/logup_screen.dart';
import 'package:login_screen/login_screen.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ScreenState();
  }
}

class _ScreenState extends State<Screen> {
  Widget? activeScreen;
  @override
  void initState() {
    // TODO: implement initState
    activeScreen = LogInScreen(logUpScreenUp);
    super.initState();
  }

  void logUpScreenUp() {
    setState(() {
      activeScreen = const LogUpScreen();
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
