import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'drawer.dart';

class Result extends StatelessWidget {
  const Result(this.result, this.resetHandler, {super.key});

  final int result;
  final VoidCallback resetHandler;

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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 130,
        ),
        CardTitle(resultComment),
        Text(
          '$result',
          style: const TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.bold,
            fontSize: 120,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        FloatingActionButton(
          onPressed: resetHandler,
          foregroundColor: Colors.blueGrey,
          backgroundColor: Colors.white,
          child: const Icon(Icons.backspace),
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton(
              onPressed: () {
                context.go('/feedback');
              },
              child: const Text('Provide feedback'),
            ))
      ],
    );
  }
}
