import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import 'drawer.dart';
import 'quiz.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool autoValidate = true;

  var genderOptions = ['Male', 'Female', 'Others'];

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Registration Form',
            style: TextStyle(
              fontSize: 25,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
          FormBuilder(
            key: _formKey,
            child: Wrap(
              spacing: 10,
              runSpacing: 5,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                FormBuilderTextField(
                  name: 'name',
                  decoration: const InputDecoration(
                    labelText: 'User Name',
                    suffixIcon: Icon(
                      Icons.person_add,
                    ),
                    hintText: 'Enter your user name',
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.maxLength(30),
                  ]),
                ),
                FormBuilderTextField(
                  name: 'age',
                  decoration: const InputDecoration(
                    labelText: 'Age',
                    suffixIcon: Icon(
                      Icons.numbers,
                    ),
                    hintText: 'Enter your age',
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                    FormBuilderValidators.max(100),
                    FormBuilderValidators.min(15)
                  ]),
                  keyboardType: TextInputType.number,
                ),
                FormBuilderDropdown(
                  name: 'gender',
                  decoration: const InputDecoration(
                      labelText: 'Gender', hintText: 'Select gender'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Please select a gender'),
                  ]),
                  items: genderOptions
                      .map((gender) => DropdownMenuItem(
                            alignment: AlignmentDirectional.center,
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                ),
                FormBuilderTextField(
                  name: 'email',
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    suffixIcon: Icon(
                      Icons.email,
                    ),
                    hintText: 'Enter your email',
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
                FormBuilderRadioGroup(
                  name: 'Category',
                  options: ['Normal', 'Advanced']
                      .map((option) => FormBuilderFieldOption(
                            value: option,
                            child: Text(option),
                          ))
                      .toList(),
                  decoration: const InputDecoration(
                      labelText: 'Category',
                      border: InputBorder.none,
                      errorStyle: TextStyle(height: 0.1)),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Please select a category')
                  ]),
                  controlAffinity: ControlAffinity.leading,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.saveAndValidate() ?? false) {
                _formKey.currentState?.reset();
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Registration successful')));
                context.go('/quiz');
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
