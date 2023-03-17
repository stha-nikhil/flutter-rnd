import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question(this.questionText, {super.key});

  final String questionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(9.8),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 30, fontFamily: 'Lato', fontWeight: FontWeight.w600,fontStyle: FontStyle.italic),
        textAlign: TextAlign.center,
      ),
    );
  }
}
