// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  Color colorGreen(String ans1, String ans2) {
    if (ans1 == ans2) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return //SizedBox(
        //height: 30,
        //child: SingleChildScrollView(
        // הופך את אאפליקציה לאפשרות לגלילה
        Column(
      children: summaryData.map(
        (data) {
          return Row(
            children: [
              Text(((data['question_index'] as int) + 1).toString()),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      data['question'] as String,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontFamily: 'Raleway'),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      data['user_answer'] as String,
                    ),

                    //),
                    Text(
                      data['corect_ansewr'] as String,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ).toList(),
    );
    //),
    //);
  }
}
