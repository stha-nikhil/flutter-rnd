import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question(this.questionText, {super.key});

  final String questionText;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(9.8),
        child: Text(
          questionText,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ));
  }
}
