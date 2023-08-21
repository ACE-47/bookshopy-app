import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../common/constants.dart';

class BestSellerCell extends StatelessWidget {
  const BestSellerCell(
      {super.key,
      required this.img,
      required this.name,
      required this.author,
      required this.rating});

  final String img;
  final String name;
  final String author;
  final double rating;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: size.width * 0.32,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(

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
                  child: Image.asset(
                    img,
                    fit: BoxFit.cover,
                    height: size.width * 0.45,
                    width: size.width * 0.3,
                  ),
                )),
            const SizedBox(height: 10),
            Text(
              name,
              // maxLines: 3,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: TColor.text,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              author,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: TColor.subTitle,
                fontSize: 13,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            IgnorePointer(
              ignoring: true,
              child: RatingBar.builder(
                itemSize: 15,
                initialRating: rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
