import 'package:bookshopy_app/common/form_error.dart';
import 'package:flutter/material.dart';

import '../../common/constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _keyForm = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String firstName = '';
  String lastName = '';
  String username = '';

  final List<String> errors = ['Demo Error'];

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: SingleChildScrollView(
          child: Column(
        children: [
          buildNameFormField(firstName, 'First Name'),
          const SizedBox(
            height: 15,
          ),
          buildNameFormField(lastName, 'Last Name'),
          const SizedBox(
            height: 15,
          ),
          buildNameFormField(username, 'User Name'),
          const SizedBox(
            height: 15,
          ),
          buildEmailFormField(),
          const SizedBox(
            height: 15,
          ),
          buildPasswordFormField(),
          const SizedBox(
            height: 15,
          ),
          FormError(error: errors)
        ],
      )),
    );
  }

  Container buildEmailFormField() {
    return Container(
      decoration: BoxDecoration(
          color: TColor.textbox, borderRadius: BorderRadius.circular(30)),
      child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          onSaved: (newValue) => email = newValue!,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kEmailNullError);
            } else if (emailValidatorRegExp.hasMatch(value)) {
              removeError(error: kInvalidEmailError);
            }
            return;
          },
          validator: (value) {
            if (value!.isEmpty) {
              addError(error: kEmailNullError);
              return "";
            } else if (!emailValidatorRegExp.hasMatch(value)) {
              addError(error: kInvalidEmailError);
              return "";
            }
            return null;
          },
          decoration: inputDecorationStyle('Email Address')),
    );
  }

  Container buildPasswordFormField() {
    return Container(
      decoration: BoxDecoration(
          color: TColor.textbox, borderRadius: BorderRadius.circular(30)),
      child: TextFormField(
          obscureText: true,
          onSaved: (newValue) => password = newValue!,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kPassNullError);
            } else if (value.length >= 8) {
              removeError(error: kShortPassError);
            }
            password = value;
            return;
          },
          validator: (value) {
            if (value!.isEmpty) {
              addError(error: kPassNullError);
              return "";
            } else if (value.length < 8) {
              addError(error: kShortPassError);
              return "";
            }
            return null;
          },
          decoration: inputDecorationStyle('your password')),
    );
  }

  Container buildNameFormField(String name, String title) {
    return Container(
      decoration: BoxDecoration(
          color: TColor.textbox, borderRadius: BorderRadius.circular(30)),
      child: TextFormField(
          // keyboardType: TextInputType.emailAddress,
          onSaved: (newValue) => name = newValue!,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kNamelNullError);
            }
            name = value;
            return;
          },
          validator: (value) {
            if (value!.isEmpty) {
              addError(error: kNamelNullError);
              return "";
            }
            return null;
          },
          decoration: inputDecorationStyle(title)),
    );
  }
}
