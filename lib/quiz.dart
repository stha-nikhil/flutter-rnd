import 'package:flutter/material.dart';
import 'package:flutter_app/question.dart';

import 'answer.dart';
import 'drawer.dart';
import 'points.dart';

class Quiz extends StatelessWidget {
  const Quiz(this.questions, this.questionIndex, this.answerFunc, this.points,
      this.reset,
      {super.key});

  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerFunc;
  final int points;
  final VoidCallback reset;

  @override
  Widget build(BuildContext context) {
    return questionIndex < questions.length
        ? Column(
            children: [
              const SizedBox(
                width: 200,
                height: 50,
                child: CardTitle(null),
              ),
              SizedBox(
                height: 70,
              ),
              Question(
                questions[questionIndex]['questionText'] as String,
              ),
              const SizedBox(
                height: 80,
              ),
              ...(questions[questionIndex]['answers']
                      as List<Map<String, Object>>)
                  .map((answer) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  child: Answer(() => answerFunc(answer['points']),
                      answer['answerText'] as String),
                );
              }).toList(),
            ],
          )
        : Result(points, reset);
  }
}
