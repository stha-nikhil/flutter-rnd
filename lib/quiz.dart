import 'package:flutter/material.dart';
import 'package:flutter_app/question.dart';
import 'package:provider/provider.dart';

import 'answer.dart';
import 'drawer.dart';
import 'points.dart';
import 'src/providers/count_provider.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CountPoints>(builder: (context, questionProvider, child) {
      return questionProvider.questionIndex < questionProvider.questions.length
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
                // Question(
                //   questionProvider.questions[questionProvider.questionIndex]
                //   ['questionText'] as String,
                // ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(9.8),
                  child: Text(
                    questionProvider.questions[questionProvider.questionIndex]
                        ['questionText'] as String,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                ...(questionProvider.questions[questionProvider.questionIndex]
                        ['answers'] as List<Map<String, Object>>)
                    .map((answer) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: ElevatedButton(
                        onPressed: () {
                          questionProvider.answerFunc(answer['points'] as int);
                        },
                        child: Text(
                          answer['answerText'] as String,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ),
                    // Answer(
                    //     () => questionProvider
                    //         .answerFunc(answer['points'] as int),
                    //     answer['answerText'] as String),
                  );
                }).toList(),
              ],
            )
          : Result(questionProvider.totalPoint, questionProvider.reset);
    });
  }
}
//
// class MyQuiz extends StatelessWidget {
//   const MyQuiz({super.key});
//
//   // const QuizAnswer(this.questions, this.questionIndex, this.answerFunc,
//   //     this.points, this.reset,
//   //     {super.key});
//   //
//   // final List<Map<String, Object>> questions;
//   // final int questionIndex;
//   // final Function answerFunc;
//   // final int points;
//   // final VoidCallback reset;
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<CountPoints>(
//       builder: ((context, questionProvider, child) =>
//           questionProvider.questionIndex < questionProvider.questions.length
//               ? Column(
//                   children: [
//                     const SizedBox(
//                       width: 200,
//                       height: 50,
//                       child: CardTitle(null),
//                     ),
//                     const SizedBox(
//                       height: 70,
//                     ),
//                     Question(
//                       questionProvider.questions[questionProvider.questionIndex]
//                           ['questionText'] as String,
//                     ),
//                     const SizedBox(
//                       height: 80,
//                     ),
//                     ...(questionProvider
//                                 .questions[questionProvider.questionIndex]
//                             ['answers'] as List<Map<String, Object>>)
//                         .map((answer) {
//                       return Container(
//                         margin: const EdgeInsets.all(10),
//                         child: Answer(
//                             () => questionProvider
//                                 .answerFunc(answer['points'] as int),
//                             answer['answerText'] as String),
//                       );
//                     }).toList(),
//                   ],
//                 )
//               : Result(questionProvider.totalPoint, questionProvider.reset)),
//     );
//   }
// }
