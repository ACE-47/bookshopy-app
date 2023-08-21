import 'package:bookshopy_app/common/form_error.dart';
import 'package:flutter/material.dart';

import '../../common/constants.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final _keyForm = GlobalKey<FormState>();

  String email = '';

  String password = '';

  final List<String> errors = ['Demo Error'];
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
          const SizedBox(
            height: 20,
          )
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
          decoration: inputDecorationStyle('enter your Password')),
    );
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
        decoration: inputDecorationStyle('enter your email'),
      ),
    );
  }
}
