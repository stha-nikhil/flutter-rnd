import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(this.result, {super.key});

  final int result;

  String get resultComment {
    String comment;
    if (result == 1) {
      comment = 'Need to work hard';
    } else {
      comment = 'Good Job';
    }
    return comment;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 200,
        ),
        Text(
          resultComment,
          style: const TextStyle(
            color: Colors.blueGrey,
            fontSize: 40,
          ),
          textAlign: TextAlign.center,
        ),
        Center(
          child: Text(
            '$result',
            style: const TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.bold,
              fontSize: 120,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
