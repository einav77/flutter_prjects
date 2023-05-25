import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/logPages/text_field.dart';
import 'package:quiz_app/logPages/password_field.dart';
import 'package:web_socket_channel/io.dart';
import 'package:quiz_app/user.dart';

class LogInScreen extends StatefulWidget {
  final void Function() logup;
  final void Function() start;
  final Function callback;

  const LogInScreen(this.logup, this.start, this.callback, {super.key});
  @override
  State<StatefulWidget> createState() {
    return _LogInScreenState();
  }
}

class _LogInScreenState extends State<LogInScreen> {
  List<String> inputs = [];
  String username = '';

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
              var _regChannel =
                  IOWebSocketChannel.connect("ws://10.0.0.19:8820");
              String message = "login,${firstName.text},${password.text}";

              _regChannel.sink.add(message);
              var sub;
              sub = _regChannel.stream.listen((data) {
                print(data);
                List<String> serverAns;
                serverAns = data.split(",");
                if (serverAns[0].toLowerCase() == "true") {
                  user u1 = user(data[1], data[5], data[4], data[3]);
                  setState(() {
                    username = firstName.text;
                    inputs.add(firstName.text);
                    inputs.add(password.text);
                    finalInput = inputs;
                    inputs = [];
                    print(finalInput);
                    widget.callback(firstName.text);
                  });
                  sub.cancel;
                  start();
                  _regChannel.sink.close();
                } else {
                  _regChannel.sink.close();
                  setState(
                    () {
                      print("check");
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('some troubles in your sign in '),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    },
                  );
                }
              });
            },
            child: const Text('Log in'),
          ),
          ElevatedButton(onPressed: widget.logup, child: const Text("sing up"))
        ],
      ),
    );
  }

  String getUsername() {
    return username;
  }
}
