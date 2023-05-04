// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/question_summary.dart';

class ResulesScreen extends StatelessWidget {
  const ResulesScreen(this.chosenAnswers, this.back, {super.key});
  final List<String> chosenAnswers;
  final void Function() back;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      //loop body
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'corect_ansewr': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final summaryData = getSummaryData();
    final numOfQuestion = questions.length;
    final numOfCorrectQuestion = summaryData.where((data) {
      return data['user_answer'] == data['corect_answer'];
    }).length;
    print(chosenAnswers.length);
    print('HERE');
    print(summaryData);
    print((getSummaryData()));
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "You answerd X out of Y correct!",
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Raleway', fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
                onPressed: back,
                icon: const Icon(
                  Icons.loop,
                  color: Colors.white,
                ),
                label: const Text(
                  "Restart Quiz!",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
