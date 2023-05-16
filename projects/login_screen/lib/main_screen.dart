import 'package:flutter/material.dart';
import 'package:login_screen/logup_screen.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ScreenState();
  }
}

class _ScreenState extends State<Screen> {
  void logUpScreen() {
    activeScreen = const SizedBox(
      height: 20,
    );
  }

  Widget activeScreen = const LogUpScreen();
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
