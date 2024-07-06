import 'package:flutter/material.dart';
import '/screens/signup/complete_signup/complete_form.dart';

import '../../../common/constants.dart';
import '../../../common_widget/round_button.dart';

class CompleteSignUpScreen extends StatelessWidget {
  static const routeName = '/complete-sign-up';
  const CompleteSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: TColor.primary,
            ),
            onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25, right: 18, left: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign Up',
                style: TextStyle(
                    color: TColor.text,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 40),
              const CompleteForm(),
              const SizedBox(
                height: 15,
              ),
              RoundOutlineButton(
                // ....
                title: 'Sign Up',
                onPress: () {
                  // Navigator.pushNamed(context, CompleteSignUpScreen.routeName);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
