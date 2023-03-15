import 'package:flutter/material.dart';

// void main(){
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void answer() {
    setState(() {
      if (_questionIndex == 0){
        _questionIndex = 1;
      }
      else{
        _questionIndex = 0;
      }
    });
    print('Answer Recorded!');
    print('Index: $_questionIndex');
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
            Text(questions[_questionIndex]),
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
