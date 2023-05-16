import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/logPages/text_field.dart';
import 'package:quiz_app/logPages/password_field.dart';

class LogInScreen extends StatefulWidget {
  final void Function() logup;
  final void Function() start;
  const LogInScreen(this.logup, this.start, {super.key});
  @override
  State<StatefulWidget> createState() {
    return _LogInScreenState();
  }
}

class _LogInScreenState extends State<LogInScreen> {
  List<String> inputs = [];

  TextStyle myTextStyle = const TextStyle(
    fontFamily: 'Lato',
    fontWeight: FontWeight.bold,
    fontSize: 40,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    void Function() start = widget.start;
    List<String> finalInput = [];
    int numToHelp = 0;
    List<String> input = [];
    TextEditingController firstName = TextEditingController();
    TextEditingController lastName = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController password = TextEditingController();

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Log in screen",
            style: TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          CustomTextField(
              textControoller: firstName,
              hintText: "enter your first name",
              onSubmit: (text) {
                setState(() {
                  inputs.add(text);
                });
              }),
          const SizedBox(height: 20),
          PasswordTextField(
              controller: password,
              hintText: "enter your password",
              onSaved: (item) {
                setState(() {
                  inputs.add(item!);
                });
              }),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                inputs.add(firstName.text);
                inputs.add(password.text);
                finalInput = inputs;
                inputs = [];
                print(finalInput);
              });
              start();
            },
            child: const Text('Log in'),
          ),
          ElevatedButton(onPressed: widget.logup, child: const Text("sing up"))
        ],
      ),
    );
  }
}
