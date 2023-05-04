// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:quiz_app/ans_button.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/quiz.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage(this.backHome, this.chooseAnswer, {super.key});
  final void Function() backHome;
  final void Function(String answer) chooseAnswer;

  @override
  State<QuestionPage> createState() {
    // TODO: implement createState
    return _QuestionPageState();
  }
}

class _QuestionPageState extends State<QuestionPage> {
  var currentQuestionNum = 0;

  void answerQuestion(String selectedAnswer) {
    widget.chooseAnswer(selectedAnswer);

    setState(() {
      currentQuestionNum++;
      print(currentQuestionNum);
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionNum];
    // TODO: implement build
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map(
              (item) {
                return AnswerButton(item, () {
                  answerQuestion(item);
                });
              },
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: widget.backHome, child: const Text("back home")),
          ],
        ),
      ),
    );
  }
}
