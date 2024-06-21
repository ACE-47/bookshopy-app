import 'package:flutter/material.dart';

import '../common/constants.dart';

class TopPicsCell extends StatelessWidget {
  const TopPicsCell({
    super.key,
    required this.img,
    required this.name,
    required this.author,
  });

  final String img;
  final String name;
  final String author;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: size.width * 0.32,
                // padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0, 2),
                          blurRadius: 5)
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    img,
                    fit: BoxFit.cover,
                    height: size.width * 0.45,
                    width: size.width * 0.3,
                  ),
                )),
            const SizedBox(height: 10),
            Text(
              name,
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: TColor.text,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              author,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: TColor.subTitle,
                fontSize: 13,
              ),
            )
          ],
        ),
      ),
    );
  }
}
