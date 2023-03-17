import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer(this.answerHandler, {super.key});

  final VoidCallback answerHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text(
          'Answer1s',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        onPressed: answerHandler,
      ),
    );
  }
}
