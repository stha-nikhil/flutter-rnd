import 'package:flutter/cupertino.dart';

class CountPoints with ChangeNotifier {
  int _questionIndex = 0;
  int _totalPoint = 0;


  var _questions = [
    {
      'questionText': 'A compiler transforms _____',
      'answers': [
        {'answerText': 'Code', 'points': 1},
        {'answerText': 'Swift', 'points': 0},
        {'answerText': 'Braces', 'points': 0}
      ]
    },
    {
      'questionText': 'Which of these is a programming language?',
      'answers': [
        {'answerText': 'HTML', 'points': 0},
        {'answerText': 'Python', 'points': 1}
      ]
    }
  ];
  int get questionIndex => _questionIndex;
  int get totalPoint => _totalPoint;
  get questions => _questions;

  void answerFunc(int points) {
    _totalPoint += points;
    _questionIndex += 1;
  }

  void reset() {
      _totalPoint = 0;
      _questionIndex = 0;
  }
}
