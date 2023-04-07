import 'package:flutter/material.dart';
import 'package:flutter_app/question.dart';

import 'answer.dart';
import 'drawer.dart';
import 'points.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var _questionIndex = 0;
  var _totalPoint = 0;

  static const questions = [
    {
      'questionText': 'A compiler transforms _____',
      'answers': [
        {'answerText': 'Code', 'points': 1},
        {'answerText': 'Swift', 'points': 0},
        {'answerText': 'Braces', 'points': 0}
      ]
    },
    {
      'questionText': 'Which of these is a programming language?',
      'answers': [
        {'answerText': 'HTML', 'points': 0},
        {'answerText': 'Python', 'points': 1}
      ]
    }
  ];

  void _answer(int points) {
    _totalPoint += points;
    setState(() {
      _questionIndex += 1;
    });
  }

  void _reset() {
    setState(() {
      _totalPoint = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return QuizAnswer(questions, _questionIndex, _answer, _totalPoint, _reset);
  }
}


class QuizAnswer extends StatelessWidget {
  const QuizAnswer(this.questions, this.questionIndex, this.answerFunc, this.points,
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
              const SizedBox(
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
