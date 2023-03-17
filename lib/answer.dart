import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer(this.answerHandler, {super.key});

  final VoidCallback answerHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(
          'Answer1s',
          style: TextStyle(fontFamily: 'Montserrat'),
        ),
        onPressed: answerHandler,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey,
        ),
      ),
    );
  }
}
