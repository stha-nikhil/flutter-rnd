import 'package:flutter/material.dart';

class FeedBackForm extends StatefulWidget {
  const FeedBackForm({Key? key}) : super(key: key);

  @override
  State<FeedBackForm> createState() => _FeedBackFormState();
}

class _FeedBackFormState extends State<FeedBackForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'Please enter your name',
                icon: Icon(Icons.person)),
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: 'Contact',
                hintText: 'Please enter your email / phone number',
                icon: Icon(Icons.contact_page)),
          ),
        ],
      ),
    );
  }
}
