import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';
import 'drawer.dart';
import 'style.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answer() {
    setState(() {
      if (_questionIndex == 0) {
        _questionIndex = 1;
      } else {
        _questionIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questionText': 'A compiler transforms _____',
        'answers': ['Code', 'Swift', 'Braces'],
      },
      {
        'questionText': 'Which of these is a programming language?',
        'answers': ['HTML', 'Go Lang'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Demo App'),
        ),
        drawer: const DrawerTheme(
          data: drawerStyle,
          child: AppDrawer(),
        ),
        body: Column(
          children: [
            const SizedBox(
              width: 200,
              height: 50,
              child: CardTitle(),
            ),
            SizedBox(
              height: 70,
            ),
            Question(
              questions[_questionIndex]['questionText'] as String,
            ),
            const SizedBox(
              height: 80,
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Container(
                margin: const EdgeInsets.all(10),
                child: Answer(_answer, answer),
              );
            }).toList(),
          ],
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey.shade100,
        appBarTheme: const AppBarTheme(
          titleTextStyle: appBarTextStyle,
        ),
        textTheme: const TextTheme(
          titleMedium: questionTextStyle,
          titleSmall: cardTextStyle,
          labelMedium: answerTextStyle,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: elevatedButtonStyle.style,
        ),
        drawerTheme: drawerStyle,
        cardTheme: cardStyle,
      ),
    );
  }
}
