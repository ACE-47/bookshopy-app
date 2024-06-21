import 'package:bookshopy_app/screens/login/login_form.dart';
import 'package:flutter/material.dart';

import '../../common/constants.dart';

class LogInScreen extends StatefulWidget {
  static const routeName = '/log-in';
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool isStay = false;

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
                'Log In',
                style: TextStyle(
                    color: TColor.text,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 40),
              const LogInForm(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isStay = !isStay;
                      });
                    },
                    icon: Icon(
                      isStay ? Icons.check_box : Icons.check_box_outline_blank,
                      color: isStay ? TColor.primary : TColor.subTitle,
                    ),
                  ),
                  Text(
                    'Remember me ',
                    style: TextStyle(fontSize: 17, color: TColor.subTitle),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forget Your Password?',
                      style: TextStyle(fontSize: 17, color: TColor.subTitle),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
