import 'package:flutter/material.dart';

class FeedBackForm extends StatefulWidget {
  const FeedBackForm({Key? key}) : super(key: key);

  @override
  State<FeedBackForm> createState() => _FeedBackFormState();
}

class _FeedBackFormState extends State<FeedBackForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _addressTextController = TextEditingController();
  final TextEditingController _messageTextController = TextEditingController();

  bool _validate = false;

  void _submit(){
    setState(() {
      _validate = true;
    });
  }

@override
Widget build(BuildContext context) {
  return Form(
    key: _formKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        const Text(
          'Feedback Form',
          style: TextStyle(
            fontSize: 25,
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 50,
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
          controller: _addressTextController,
          decoration: const InputDecoration(
              labelText: 'Contact',
              hintText: 'Please enter your phone number',
              icon: Icon(Icons.contact_page)),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '*Required Contact';
            }
            final check = num.tryParse(value);
            if (check == null) {
              return '*Only numbers allowed';
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
                errorText: _validate && _messageTextController.text.isEmpty? '*Feedback required' : null,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 150,
          height: 60,
          child: ElevatedButton(
            onPressed: () {
              _submit();
              if (_formKey.currentState!.validate() &&
                  _messageTextController.text.isNotEmpty) {
                _nameTextController.clear();
                _messageTextController.clear();
                _addressTextController.clear();
                _messageTextController.clear();
                _validate = false;
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Validation successful')));
              }
            },
            child: const Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    ),
  );
}}
