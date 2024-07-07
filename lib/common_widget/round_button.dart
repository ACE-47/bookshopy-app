import 'package:flutter/material.dart';


class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;

  const RoundButton({super.key});
<<<<<<< HEAD

  const RoundButton({
    super.key,
    required this.title,
    required this.onPress,
=======
  bool isLoading;

  RoundButton({
    super.key,
    required this.title,
    required this.onPress,
    this.isLoading = false,
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
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
<<<<<<< HEAD
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
=======
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
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
