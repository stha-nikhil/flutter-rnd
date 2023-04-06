import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

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
        padding: EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Register Form',
              style: TextStyle(
                fontSize: 25,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
            FormBuilder(
              key: _formKey,
              child: Wrap(
                spacing: 30,
                runSpacing: 20,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
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
                  ),
                  FormBuilderDropdown(
                    name: 'gender',
                    decoration: const InputDecoration(
                        labelText: 'Gender', hintText: 'Select gender'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    items: genderOptions
                        .map((gender) => DropdownMenuItem(
                      alignment: AlignmentDirectional.centerStart,
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
                    ),
                    controlAffinity: ControlAffinity.leading,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.saveAndValidate() ?? false) {
                  _formKey.currentState?.reset();
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Validation successful')));
                }
              },
              child: const Text('Submit'),
            ),

          ],
        ));
  }
}
