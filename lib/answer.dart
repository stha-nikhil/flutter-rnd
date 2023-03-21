import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer(this.answerHandler, this.answerText, {super.key});

  final String answerText ;
  final VoidCallback answerHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text(
          answerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        onPressed: answerHandler,
      ),
    );
  }
}
