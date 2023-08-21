import 'package:flutter/material.dart';


class GenerCell extends StatelessWidget {
  const GenerCell({
    super.key,
    required this.img,
    required this.name,
    required this.bgColor,
  });

  final String img;
  final String name;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: size.width * 0.7,
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            img,
            fit: BoxFit.fitWidth,
            height: size.width * 0.5,
            width: size.width * 0.7,
          ),
          const SizedBox(height: 10),
          Text(
            name,
            maxLines: 3,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
