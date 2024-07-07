import 'package:bookshopy_app/common/form_error.dart';
<<<<<<< HEAD
import 'package:flutter/material.dart';

import '../../common/constants.dart';
=======
import 'package:bookshopy_app/provider/auth.dart';
import 'package:provider/provider.dart';

import '../../common_widget/round_button.dart';
import 'complete_signup/complete_signup_screen.dart';
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _keyForm = GlobalKey<FormState>();
<<<<<<< HEAD
=======
  bool _isLoading = false;
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8

  String email = '';
  String password = '';
  String firstName = '';
  String lastName = '';
<<<<<<< HEAD
  String username = '';

  final List<String> errors = ['Demo Error'];
=======
  String userName = '';

  final List<String> errors = [];
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8

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

<<<<<<< HEAD
=======
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

>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: SingleChildScrollView(
          child: Column(
        children: [
<<<<<<< HEAD
          buildNameFormField(firstName, 'First Name'),
          const SizedBox(
            height: 15,
          ),
          buildNameFormField(lastName, 'Last Name'),
          const SizedBox(
            height: 15,
          ),
          buildNameFormField(username, 'User Name'),
=======
          buildFirstNameFormField(),
          const SizedBox(
            height: 15,
          ),
          buildLastNameFormField(),
          const SizedBox(
            height: 15,
          ),
          buildUserNameFormField(),
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
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
<<<<<<< HEAD
          FormError(error: errors)
=======
          FormError(error: errors),
          const SizedBox(height: 15),
          RoundButton(
            isLoading: _isLoading,
            title: 'next',
            onPress: () async {
              _submit();
            },
          )
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
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
<<<<<<< HEAD
          decoration: inputDecorationStyle('Email Address')),
=======
          decoration:
              inputDecorationStyle('Email Address', const Icon(Icons.email))),
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
    )
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
<<<<<<< HEAD
          decoration: inputDecorationStyle('your password')),
    );
  }

  Container buildNameFormField(String name, String title) {
=======
          decoration: inputDecorationStyle(
              'your password', const Icon(Icons.password_sharp))),
    )
  }

  Container buildUserNameFormField() {
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
    return Container(
      decoration: BoxDecoration(
          color: TColor.textbox, borderRadius: BorderRadius.circular(30)),
      child: TextFormField(
          // keyboardType: TextInputType.emailAddress,
<<<<<<< HEAD
          onSaved: (newValue) => name = newValue!,
=======
          onSaved: (newValue) => userName = newValue!,
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kNamelNullError);
            }
<<<<<<< HEAD
            name = value;
=======
            userName = value;
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
            return;
          },
          validator: (value) {
            if (value!.isEmpty) {
              addError(error: kNamelNullError);
              return "";
            }
            return null;
          },
<<<<<<< HEAD
          decoration: inputDecorationStyle(title)),
=======
          decoration: inputDecorationStyle(
              'UserName', const Icon(Icons.person_2_outlined))),
    )
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
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
    );
  }
}
