import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/logPages/text_field.dart';
import 'package:quiz_app/logPages/password_field.dart';
import 'package:web_socket_channel/io.dart';

class LogUpScreen extends StatefulWidget {
  const LogUpScreen(this.start, {super.key});
  final void Function() start;
  @override
  State<StatefulWidget> createState() {
    return _LogUpScreenState();
  }
}

class _LogUpScreenState extends State<LogUpScreen> {
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
    TextEditingController username = TextEditingController();
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
            "Log up screen",
            style: TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          CustomTextField(
              textControoller: username,
              hintText: "enter your username",
              onSubmit: (text) {
                setState(() {
                  inputs.add(text);
                });
              }),
          const SizedBox(height: 10),
          CustomTextField(
              textControoller: firstName,
              hintText: "enter your first name",
              onSubmit: (text) {
                setState(() {
                  inputs.add(text);
                });
              }),
          const SizedBox(height: 10),
          CustomTextField(
              textControoller: lastName,
              hintText: "enter your last name",
              onSubmit: (text) {
                setState(() {
                  inputs.add(text);
                });
              }),
          const SizedBox(height: 10),
          PasswordTextField(
              controller: password,
              hintText: "enter your password",
              onSaved: (item) {
                setState(() {
                  inputs.add(item!);
                });
              }),
          const SizedBox(height: 10),
          CustomTextField(
              textControoller: email,
              hintText: "enter your email",
              onSubmit: (text) {
                setState(() {
                  inputs.add(text);
                });
              }),
          const SizedBox(height: 10),
          CustomTextField(
              textControoller: phone,
              hintText: "enter your phone number",
              onSubmit: (text) {
                setState(() {
                  inputs.add(text);
                });
              }),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              setState(() {
                inputs.add(username.text);
                inputs.add(firstName.text);
                inputs.add(lastName.text);
                inputs.add(password.text);
                inputs.add(phone.text);
                inputs.add(email.text);
                finalInput = inputs;
                inputs = [];
                print(finalInput);
                var _regChannel =
                    IOWebSocketChannel.connect("ws://10.0.0.19:8820");
                String message =
                    "logup,${username.text},${firstName.text},${lastName.text},${password.text},${phone.text},${email.text}, empty";
                _regChannel.sink.add(message);
              });
              start();
            },
            child: const Text('Save'),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  username.clear();
                  firstName.clear();
                  lastName.clear();
                  phone.clear();
                  password.clear();
                  email.clear();
                });
              },
              child: const Text("clear all"))
        ],
      ),
    );
  }
}
