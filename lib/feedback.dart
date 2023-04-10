import 'package:flutter/material.dart';

import 'drawer.dart';
import 'register.dart';

class FeedBackForm extends StatefulWidget {
  const FeedBackForm({Key? key}) : super(key: key);

  @override
  State<FeedBackForm> createState() => _FeedBackFormState();
}

class _FeedBackFormState extends State<FeedBackForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _phoneTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _messageTextController = TextEditingController();

  bool _validate = false;

  void _submit() {
    setState(() {
      _validate = true;
    });
  }

  get _messageErrorText {
    final message = _messageTextController.value.text;
    if (message.isEmpty) {
      return '*Feedback can\'t be empty';
    }
    if (message.length > 50) {
      return '*Max character is 50';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 20,
      ),
      Form(
        key: _formKey,
        child: Wrap(
          runSpacing: 5,
          alignment: WrapAlignment.center,
          children: <Widget>[
            const SizedBox(
              child: Text(
                'Feedback Form',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: _nameTextController,
              decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'Please enter your name',
                  icon: Icon(Icons.person)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '*Required Name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _phoneTextController,
              decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  hintText: 'Please enter your phone number',
                  icon: Icon(Icons.contact_page)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '*Required Phone Number';
                }
                if (value.length != 10) {
                  return '*Invalid Phone Number';
                }
                final check = num.tryParse(value);
                if (check == null) {
                  return '*Only numbers allowed';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _emailTextController,
              decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Please enter your email address',
                  icon: Icon(Icons.email)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '*Required Email';
                }
                bool emailValid = RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                    .hasMatch(value);
                if (emailValid == false) {
                  return '*Invalid email';
                }
                return null;
              },
            ),
            Card(
              color: Colors.grey.shade100,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0.1, vertical: 15),
                child: TextField(
                  maxLines: 6,
                  controller: _messageTextController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Feedback',
                    hintText: 'Please enter your feedback',
                    icon: const Icon(Icons.inbox),
                    errorText: _validate ? _messageErrorText : null,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        width: 150,
        height: 70,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ElevatedButton(
            onPressed: () {
              _submit();
              if (_formKey.currentState!.validate() &&
                  _messageTextController.text.isNotEmpty) {
                _nameTextController.clear();
                _messageTextController.clear();
                _phoneTextController.clear();
                _emailTextController.clear();
                _validate = false;
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Thank you for your feed back.')));
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AppDrawer(RegisterForm())));
              }
            },
            child: const Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    ]);
  }
}
