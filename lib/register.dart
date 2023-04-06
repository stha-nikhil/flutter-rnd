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
            SizedBox(
              height: 10,
            ),
            Text(
              'Register Form',
              style: TextStyle(
                fontSize: 25,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
            FormBuilder(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  FormBuilderTextField(
                    name: 'name',
                    decoration: InputDecoration(
                      labelText: 'User Name',
                      suffixIcon: Icon(
                        Icons.person_add,
                      ),
                      hintText: 'Enter your user name',
                    ),
                  ),
                  FormBuilderTextField(
                    name: 'age',
                    decoration: InputDecoration(
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
                    decoration: InputDecoration(
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
                ],
              ),
            ),
          ],
        ));
  }
}
