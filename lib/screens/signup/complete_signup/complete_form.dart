import 'package:bookshopy_app/common/form_error.dart';
import 'package:bookshopy_app/provider/auth.dart';
// import 'package:bookshopy_app/screens/home/home_screen.dart';
import 'package:bookshopy_app/screens/main_tab/main_tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/constants.dart';
import '../../../common_widget/round_button.dart';

class CompleteForm extends StatefulWidget {
  const CompleteForm({super.key});

  @override
  State<CompleteForm> createState() => _CompleteFormState();
}

class _CompleteFormState extends State<CompleteForm> {
  final _keyForm = GlobalKey<FormState>();
  bool _isLoading = false;

  String phoneNumber = '';

  DateTime birthDate = DateTime.now();

  //
  final List<String> errors = [];

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

  void _submitCompleteSignUpForm() async {
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
          .completeSignUp(phoneNumber, birthDate)
          .then((value) => Navigator.of(context)
              .pushReplacementNamed(MainTabScreen.routeName));
      setState(() {
        _isLoading = false;
      });
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
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: Column(
        children: [
          buildNameFormField(),
          const SizedBox(
            height: 40,
          ),
          buildDateFormField(),
          const SizedBox(
            height: 40,
          ),
          FormError(error: errors),
          const SizedBox(
            height: 15,
          ),
          RoundOutlineButton(
            // ....
            title: 'Sign Up',
            onPress: _submitCompleteSignUpForm,
          )
        ],
      ),
    );
  }

  Container buildNameFormField() {
    return Container(
      decoration: BoxDecoration(
          color: TColor.textbox, borderRadius: BorderRadius.circular(30)),
      child: TextFormField(
          keyboardType: TextInputType.phone,
          onSaved: (newValue) => phoneNumber = newValue!,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kPhoneNumberNullError);
            }
            return;
          },
          validator: (value) {
            if (value!.isEmpty) {
              addError(error: kPhoneNumberNullError);
              return "";
            }
            return null;
          },
          decoration:
              inputDecorationStyle('Mobile Phone', const Icon(Icons.numbers))),
    );
  }

  Container buildDateFormField() {
    return Container(
      decoration: BoxDecoration(
          color: TColor.textbox, borderRadius: BorderRadius.circular(30)),
      child: TextFormField(
          keyboardType: TextInputType.datetime,
          onSaved: (newValue) => phoneNumber = newValue!,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kPhoneNumberNullError);
            }
            return;
          },
          validator: (value) {
            if (value!.isEmpty) {
              addError(error: kPhoneNumberNullError);
              return "";
            }
            return null;
          },
          decoration: inputDecorationStyle(
              'DateTime',
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.calendar_today)))),
    );
  }
}
