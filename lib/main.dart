import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var current = WordPair.random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text(current.asCamelCase),
        ElevatedButton(
          onPressed: getNext,
          child: Text('Next'),
        ),
      ]),
    );
  }

  //function to update random word in current and set state
  void getNext() {
    setState(() {
      current = WordPair.random();
    });
  }
}
