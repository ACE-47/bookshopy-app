import 'package:bookshopy_app/provider/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/constants.dart';

class AuthorScreen extends StatefulWidget {
  static const routeName = '/author';
  const AuthorScreen({super.key});

  @override
  State<AuthorScreen> createState() => _AuthorScreenState();
}

class _AuthorScreenState extends State<AuthorScreen> {
  final bool _isInit = true;

  final List purArr = [
    "assets/img/p1.jpg",
    "assets/img/p2.jpg",
    "assets/img/p3.jpg"
  ];

  final List sResultArr = [
    {
      "img": "assets/img/p1.jpg",
      "description":
          "A must read for everybody. This book taught me so many things about...",
      "rate": 5.0
    },
    {
      "img": "assets/img/p2.jpg",
      "description":
          "#1 international bestseller and award winning history book.",
      "rate": 4.0
    }
  ];

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<Products>(context).fetchAndSetFrontProducts();
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: TColor.primary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Will Newman",
                          style: TextStyle(
                              color: TColor.text,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Constantly travelling and keeping up to date with business related books.",
                          style:
                              TextStyle(color: TColor.subTitle, fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 11),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        "assets/img/u1.png",
                        width: 100,
                        height: 100,
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Icon(
                    Icons.near_me_sharp,
                    color: TColor.subTitle,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(
                    "Newcastle  -  Australia",
                    style: TextStyle(color: TColor.subTitle, fontSize: 13),
                  )),
                  const SizedBox(
                    width: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "21",
                          style: TextStyle(
                              color: TColor.subTitle,
                              fontSize: 30,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Books",
                          style:
                              TextStyle(color: TColor.subTitle, fontSize: 11),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  // you may use it in Account Page
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 15),
                  //   child: LinearRoundButton(
                  //     title: 'title',
                  //     onPress: () {
                  //       //...
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
            //
            //.. author works
            //
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Author Works",
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
              height: size.height * 0.3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: purArr.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    // navigate to book detail
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
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
                        child: Image.asset(
                          purArr[index],
                          fit: BoxFit.fitHeight,
                        )),
                  ),
                ),
              ),
            ),
            //
            //Similar works
            //
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Text(
                "Similar Works",
                style: TextStyle(
                    color: TColor.subTitle,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
