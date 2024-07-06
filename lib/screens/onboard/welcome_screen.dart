import 'package:bookshopy_app/screens/login/login_screen.dart';
import 'package:bookshopy_app/screens/signup/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../../common/constants.dart';
import '../../common_widget/round_button.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Image.asset(
            'assets/img/welcome_bg.png',
            width: size.width,
            height: size.height,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: size.width,
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Text(
                    'Books For\n Every Taste.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: TColor.primary,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  RoundButton(
                    title: 'Sign Up',
                    onPress: () {
                      Navigator.pushNamed(
                        context,
                        SignUpScreen.routeName,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  RoundButton(
                    title: 'Log In',
                    onPress: () {
                      Navigator.pushNamed(
                        context,
                        LogInScreen.routeName,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  // RoundButton(
                  //   title: 'Guest',
                  //   onPress: () {
                  //     Navigator.pushNamed(
                  //       context,
                  //       MainTabScreen.routeName,
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
