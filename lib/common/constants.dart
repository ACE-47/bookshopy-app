import 'package:flutter/material.dart';

import 'size_config.dart';

class TColor {
  static Color get primary => const Color(0xff5ABD8C);
  static Color get primaryLight => const Color(0xffAFDFC7);
  static Color get text => const Color(0xff212121);
  static Color get subTitle => const Color(0xff212121).withOpacity(0.4);

  static Color get color1 => const Color(0xff1C4A7E);
  static Color get color2 => const Color(0xffC65135);

  static Color get dColor => const Color(0xffF3F3F3);

  static Color get textbox => const Color(0xffEFEFEF).withOpacity(0.6);

  static List<Color> get button => const [
        Color(0xff5ABD8C),
        Color(0xff00FF81),
      ];

  static List<Color> get searchBGColor => const [
        Color(0xffB7143C),
        Color(0xffE6A500),
        Color(0xffEF4C45),
        Color(0xffF46217),
        Color(0xff09ADE2),
        Color(0xffD36A43),
      ];
}

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

InputDecoration inputDecorationStyle(String text, Widget icon) {
  return InputDecoration(
    suffixIcon: IconButton(
      onPressed: () {},
      icon: icon,
    ),
    // floatingLabelBehavior: FloatingLabelBehavior.always,
    //     .always, //flow label and it will not work if we add this in theme file
    contentPadding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    focusedErrorBorder: InputBorder.none,
    labelText: text,
    labelStyle: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
  );
}

// OutlineInputBorder outlineInputBorder() {
//   return OutlineInputBorder(
//     borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
//     borderSide: const BorderSide(color: kTextColor),
//   );
// }