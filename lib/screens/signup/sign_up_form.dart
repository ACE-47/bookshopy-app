import 'package:bookshopy_app/common/form_error.dart';
import 'package:bookshopy_app/provider/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/constants.dart';
import '../../common_widget/round_button.dart';
import 'complete_signup/complete_signup_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _keyForm = GlobalKey<FormState>();
  bool _isLoading = false;

  String email = '';
  String password = '';
  String firstName = '';
  String lastName = '';
  String userName = '';

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

  void _submit() async {
    if (!_keyForm.currentState!.validate()) {
      return;
    }

    errors.clear();

    _keyForm.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Auth>(context, listen: false)
          .signUp(
              userName: userName,
              password: password,
              email: email,
              firstName: firstName,
              lastName: lastName)
          .then((value) =>
              Navigator.of(context).pushNamed(CompleteSignUpScreen.routeName));
    } catch (error) {
      setState(() {
        _isLoading = false;
      });

      error as Map<String, dynamic>;
      error.forEach((key, value) {
        errors.addAll([...value]);
      });
      print(error);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: SingleChildScrollView(
          child: Column(
        children: [
          buildFirstNameFormField(),
          const SizedBox(
            height: 15,
          ),
          buildLastNameFormField(),
          const SizedBox(
            height: 15,
          ),
          buildUserNameFormField(),
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
          FormError(error: errors),
          const SizedBox(height: 15),
          RoundButton(
            isLoading: _isLoading,
            title: 'next',
            onPress: () async {
              _submit();
            },
          )
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
          decoration:
              inputDecorationStyle('Email Address', const Icon(Icons.email))),
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
          decoration: inputDecorationStyle(
              'your password', const Icon(Icons.password_sharp))),
    );
  }

  Container buildUserNameFormField() {
    return Container(
      decoration: BoxDecoration(
          color: TColor.textbox, borderRadius: BorderRadius.circular(30)),
      child: TextFormField(
          // keyboardType: TextInputType.emailAddress,
          onSaved: (newValue) => userName = newValue!,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kNamelNullError);
            }
            userName = value;
            return;
          },
          validator: (value) {
            if (value!.isEmpty) {
              addError(error: kNamelNullError);
              return "";
            }
            return null;
          },
          decoration: inputDecorationStyle(
              'UserName', const Icon(Icons.person_2_outlined))),
    );
  }

  Container buildFirstNameFormField() {
    return Container(
      decoration: BoxDecoration(
          color: TColor.textbox, borderRadius: BorderRadius.circular(30)),
      child: TextFormField(
          // keyboardType: TextInputType.emailAddress,
          onSaved: (newValue) => firstName = newValue!,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kNamelNullError);
            }
            firstName = value;
            return;
          },
          validator: (value) {
            if (value!.isEmpty) {
              addError(error: kNamelNullError);
              return "";
            }
            return null;
          },
          decoration:
              inputDecorationStyle('First Name', const Icon(Icons.person_4))),
    );
  }

  Container buildLastNameFormField() {
    return Container(
      decoration: BoxDecoration(
          color: TColor.textbox, borderRadius: BorderRadius.circular(30)),
      child: TextFormField(
          // keyboardType: TextInputType.emailAddress,
          onSaved: (newValue) => lastName = newValue!,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kNamelNullError);
            }
            lastName = value;
            return;
          },
          validator: (value) {
            if (value!.isEmpty) {
              addError(error: kNamelNullError);
              return "";
            }
            return null;
          },
          decoration: inputDecorationStyle(
              'Last Name', const Icon(Icons.person_3_outlined))),
    );
  }
}
