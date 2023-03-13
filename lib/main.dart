import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Demo"),
            backgroundColor: Colors.teal,
            elevation: 5,
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.add_card))
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              MyFormPage(title: 'Form Page'),
              MyHomePage(title: "home page"),
            ],
          ),
        ),
      ),
    );
  }
}

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key, required this.title});

  final String title;

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Enter your name',
              labelText: 'Name',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter name';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.calendar_today),
              hintText: 'Enter your age',
              labelText: 'Age',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter age';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.home),
              hintText: 'Enter your address',
              labelText: 'Address',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter address';
              }
              return null;
            },
          ),
          Container(
            padding: const EdgeInsets.only(left: 150.0, top: 40.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Data is processing'),
                  ));
                }
              },
              child: Text("Submit"),
            ),
          )
        ],
      ),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigCard(current: current),
            SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 5, padding: EdgeInsets.all(20)),
              onPressed: () {
                setState(() {
                  current = WordPair.random();
                });
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.current,
  });

  final WordPair current;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.displaySmall!;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Text(current.asLowerCase, style: style),
      ),
    );
  }
}
