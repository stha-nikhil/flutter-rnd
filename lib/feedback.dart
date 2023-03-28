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
          Card(
            color: Colors.grey.shade100,
            child: const Padding(
              // padding: EdgeInsets.only(top: 12.0),
              padding: EdgeInsets.symmetric(horizontal: 0.5, vertical: 15),
              child: TextField(
                maxLines: 6,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Feedback',
                  hintText: 'Please enter your name',
                  icon: Icon(Icons.inbox),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
