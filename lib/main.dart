import 'package:flutter/material.dart';

import 'drawer.dart';
import 'feedback.dart';
import 'quiz.dart';
import 'register.dart';
import 'src/app.dart';
import 'style.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: const AppDrawer(RegisterForm()),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey.shade100,
        appBarTheme: const AppBarTheme(
          titleTextStyle: appBarTextStyle,
        ),
        textTheme: const TextTheme(
          // titleMedium: questionTextStyle,
          titleSmall: cardTextStyle,
          labelMedium: answerTextStyle,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: elevatedButtonStyle.style,
        ),
        drawerTheme: drawerStyle,
        cardTheme: cardStyle,
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => const AppDrawer(RegisterForm()),
        '/quiz': (context) => const AppDrawer(Quiz()),
        '/feedback': (context) => const AppDrawer(FeedBackForm()),
      },
    );
  }
}