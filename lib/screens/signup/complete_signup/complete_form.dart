import 'package:bookshopy_app/common/form_error.dart';
import 'package:flutter/material.dart';

import '../../../common/constants.dart';

class CompleteForm extends StatefulWidget {
  const CompleteForm({super.key});

  @override
  State<CompleteForm> createState() => _CompleteFormState();
}

class _CompleteFormState extends State<CompleteForm> {
  final _keyForm = GlobalKey<FormState>();

  String phoneNumber = '';

  DateTime birthDate = DateTime.now();

  //
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
          FormError(error: errors)
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
          decoration: inputDecorationStyle('DateTime',
              IconButton(onPressed: () {}, icon: const Icon(Icons.calendar_today)))),
    );
  }
}
