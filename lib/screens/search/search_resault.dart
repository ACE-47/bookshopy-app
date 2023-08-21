import 'package:bookshopy_app/common_widget/liner_round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../common/constants.dart';

class SearchResault extends StatelessWidget {
  const SearchResault(
      {super.key,
      required this.img,
      required this.name,
      required this.rating,
      required this.author,
      required this.description});
  final String img;
  final String name;
  final double rating;
  final String author;
  final String description;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              img,
              width: size.width * 0.23,
              height: size.width * 0.32,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: TColor.text,
                      fontSize: 17,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  author,
                  maxLines: 1,
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
                    initialRating: rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 15,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                Text(
                  description,
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: TColor.subTitle.withOpacity(0.3),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  children: [
                    Expanded(
                        child: LinearRoundButton(
                            title: 'Add TO Cart',
                            onPress: () {
                              //..
                            })),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 30.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2,
                                offset: Offset(0, 2),
                              )
                            ]),
                        child: ElevatedButton(
                          onPressed: () {
                            //..
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              foregroundColor: TColor.text,
                              shadowColor: Colors.transparent),
                          child: Text(
                            'Add to wishlist',
                            style: TextStyle(color: TColor.text, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
