import 'package:flutter/material.dart';

import '../common/constants.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  bool isLoading;

  RoundButton({
    super.key,
    required this.title,
    required this.onPress,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      height: 50,
      minWidth: double.maxFinite,
      textColor: Colors.white,
      color: TColor.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
    );
  }
}

class RoundOutlineButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;

  const RoundOutlineButton({
    super.key,
    required this.title,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: TColor.primary, width: 2.3)),
          elevation: 0,
          shadowColor: TColor.primaryLight,
          backgroundColor: Colors.white,
          foregroundColor: TColor.primary,
          minimumSize: const Size(double.maxFinite, 50)),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );
  }
}
