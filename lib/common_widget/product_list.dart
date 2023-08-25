import 'package:flutter/material.dart';
import '/provider/product.dart';

import '../common/constants.dart';

class ProductList extends StatelessWidget {
  const ProductList(
      {super.key,
      required this.productsList,
      required this.title,
      required this.onPress});

  final List<Product> productsList;
  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 5, left: 24, right: 24),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                      color: TColor.subTitle,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              IconButton(
                  onPressed: () {
                    // navigate to author works page
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: TColor.subTitle,
                  ))
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.24,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productsList.length < 10 ? productsList.length : 10,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                // navigate to book detail
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 2,
                          offset: Offset(0, 1))
                    ]),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: productsList[index].imageUrl.isEmpty
                        ? Image.asset('assets/img/h3.jpg')
                        : Image.network(
                            productsList[index].imageUrl[0]['image'],
                            fit: BoxFit.fitHeight,
                          )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
