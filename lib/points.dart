import 'package:flutter/material.dart';

import 'drawer.dart';

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
        SizedBox(
          height: 200,
        ),
        CardTitle(resultComment),
        Center(
          child: Text(
            '$result',
            style: TextStyle(
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
