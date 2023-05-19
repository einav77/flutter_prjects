// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/questions_summary/question_summary.dart';
import 'package:quiz_app/user.dart';
import 'package:web_socket_channel/io.dart';

class ResulesScreen extends StatelessWidget {
  const ResulesScreen(
      this.chosenAnswers, this.back, this.myMatch, this.username,
      {super.key});
  final List<String> chosenAnswers;
  final void Function() back;
  final void Function() myMatch;
  final String username;

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

  int numOfGood(List<Map<String, Object>> data) {
    int numToReturn = 0;
    int i = 0;
    while (i < questions.length) {
      if (chosenAnswers[i] == data[i]['corect_ansewr'] as String) {
        print("tesh");
        numToReturn++;
      } else {}
      i++;
    }
    return numToReturn;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final summaryData = getSummaryData();
    final numOfQuestion = questions.length;
    //final numOfCorrectQuestion = summaryData.where((data) {
    //return data['user_answer'] == data['corect_answer'];
    //}).length;
    final numOfCorrectQuestion = numOfGood(summaryData);
    print(numOfCorrectQuestion);
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
            Text(
              "You answerd $numOfCorrectQuestion out of $numOfQuestion correct!",
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
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
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {
                myMatch();
              },
              icon: const Icon(Icons.man),
              label: const Text(
                "find my match",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
