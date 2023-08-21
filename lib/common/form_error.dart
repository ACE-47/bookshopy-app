import 'package:flutter/material.dart';

class FormError extends StatelessWidget {
  const FormError({super.key, required this.error});

  final List<String> error;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
            error.length,
            (index) => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.error_outline_rounded,
                      color: Colors.redAccent,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      error[index],
                      style: const TextStyle(color: Colors.redAccent),
                    )
                  ],
                ))
      ],
    );
  }
}
