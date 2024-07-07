import 'package:bookshopy_app/common/form_error.dart';
<<<<<<< HEAD
import 'package:flutter/material.dart';

import '../../common/constants.dart';
=======
import 'package:bookshopy_app/provider/auth.dart';

import 'package:provider/provider.dart';

>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final _keyForm = GlobalKey<FormState>();
<<<<<<< HEAD

  String email = '';

  String password = '';

  final List<String> errors = ['Demo Error'];
=======
  bool _isLoading = false;

  String email = '';
  String password = '';

  final List<String> errors = [];
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
  //change that way of handler errors
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
      await Provider.of<Auth>(context, listen: false).logIn(email, password);
    } catch (error) {
      setState(() {
        _isLoading = false;
      });

      errors.add(error.toString());
    }
    setState(() {
      _isLoading = false;
    });
  }

>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
  /////////
  //.......
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildEmailFormField(),
          const SizedBox(
            height: 40,
          ),
          buildPasswordFormField(),
          const SizedBox(
            height: 40,
          ),
          FormError(error: errors),
<<<<<<< HEAD
          const SizedBox(
            height: 20,
          )
=======
          const SizedBox(height: 50),
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : RoundOutlineButton(
                  title: 'Log In',
                  onPress: () async {
                    _submit();
                  },
                )
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
        ],
      ),
    );
  }

  Container buildPasswordFormField() {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: TColor.textbox, borderRadius: BorderRadius.circular(30)),
      child: TextFormField(
          obscureText: true,
          // keyboardType: TextInputType.emailAddress,
          onSaved: (newValue) => password = newValue!,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kPassNullError);
            } else if (value.length >= 8) {
              removeError(error: kShortPassError);
            }
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
          decoration: inputDecorationStyle('enter your Password')),
=======
          decoration: inputDecorationStyle(
              'enter your Password', const Icon(Icons.password_outlined))),
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
    )
  }

  Container buildEmailFormField() {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 15),
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
        decoration: inputDecorationStyle('enter your email'),
=======
        decoration: inputDecorationStyle(
            'enter your email', const Icon(Icons.email_outlined)),
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
      ),
    );
  }
}
