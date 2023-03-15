import 'package:flutter/material.dart';

// void main(){
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;

  void answer() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print('Answer Recorded!');
    print('Index: $questionIndex');
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What does HTML stand for',
      'Which of these is a programming language?',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo App'),
        ),
        body: Column(
          children: [
            Text(questions[questionIndex]),
            Text('The question: '),
            ElevatedButton(
              onPressed: answer,
              child: Text('Answer 1'),
            ),
            ElevatedButton(
              onPressed: answer,
              child: Text('Answer 2'),
            )
          ],
        ),
      ),
    );
  }
}
