import 'package:bookshopy_app/common/constants.dart';
import 'package:flutter/material.dart';

class SearchGridCell extends StatelessWidget {
  const SearchGridCell(
      {super.key, required this.index, required this.name, required this.img});

  final int index;
  final String name;
  final String img;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: TColor.searchBGColor[index % TColor.searchBGColor.length],
          borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 7),
      child: Column(
        children: [
          Text(
            name,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 15),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              img,
              height: size.height * 0.2,
              width: size.width * 0.3,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
