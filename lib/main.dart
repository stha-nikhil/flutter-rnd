import 'package:flutter/material.dart';

// void main(){
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void answer() {
    print('Answer Recorded!');
  }

  @override
  Widget build(BuildContext context) {
    var question = 'What does HTML stand for?';

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo App'),
        ),
        body: Column(
          children: [
            Text(question),
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
