import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/text_field.dart';
import 'package:login_screen/password_field.dart';

class LogUpScreen extends StatefulWidget {
  const LogUpScreen({Key? key}) : super(key: key);
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
              textControoller: firstName,
              hintText: "enter your first name",
              onSubmit: (text) {
                setState(() {
                  inputs.add(text);
                });
              }),
          const SizedBox(height: 20),
          CustomTextField(
              textControoller: lastName,
              hintText: "enter your last name",
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
          CustomTextField(
              textControoller: email,
              hintText: "enter your email",
              onSubmit: (text) {
                setState(() {
                  inputs.add(text);
                });
              }),
          const SizedBox(height: 20),
          CustomTextField(
              textControoller: phone,
              hintText: "enter your phone number",
              onSubmit: (text) {
                setState(() {
                  inputs.add(text);
                });
              }),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                inputs.add(firstName.text);
                inputs.add(lastName.text);
                inputs.add(password.text);
                inputs.add(phone.text);
                inputs.add(email.text);
                finalInput = inputs;
                inputs = [];
                print(finalInput);
              });
            },
            child: const Text('Save'),
          )
        ],
      ),
    );
  }
}
