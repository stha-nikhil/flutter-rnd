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
    var questions = [
      'What does HTML stand for?',
      'Which of these is a programming language?',
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
            SizedBox(
              height: 100,
            ),
            SizedBox(
                height: 150,
                child: Question(
                  questions[_questionIndex],
                )),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: 2,
                itemBuilder: (context, int index) {
                  return Answer(_answer);
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 35,
                ),
              ),
            ),
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
          labelMedium: answerTextStyle,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: elevatedButtonStyle.style,
        ),
        drawerTheme: drawerStyle,
      ),
    );
  }
}
