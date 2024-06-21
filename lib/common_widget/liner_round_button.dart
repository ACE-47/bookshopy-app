import 'package:flutter/material.dart';

import '../common/constants.dart';

class LinearRoundButton extends StatelessWidget {
  const LinearRoundButton(
      {super.key, required this.title, required this.onPress});

  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: TColor.button),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: TColor.primary,
              blurRadius: 2,
              offset: const Offset(0, 2),
            )
          ]),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
            shadowColor: Colors.transparent),
        child: Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
