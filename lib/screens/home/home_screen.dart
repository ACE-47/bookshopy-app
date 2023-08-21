import 'package:bookshopy_app/common/constants.dart';
import 'package:bookshopy_app/common_widget/best_seller_cell.dart';
import 'package:bookshopy_app/common_widget/gener_cell.dart';
import 'package:bookshopy_app/common_widget/recent_viewd.dart';
import 'package:bookshopy_app/common_widget/top_pics_cell.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../main_tab/main_tab_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List topPicksArr = [
    {
      "name": "The Dissapearance of Emila Zola",
      "author": "Michael Rosen",
      "img": "assets/img/1.jpg"
    },
    {
      "name": "Fatherhood",
      "author": "Marcus Berkmann",
      "img": "assets/img/2.jpg"
    },
    {
      "name": "The Time Travellers Handbook",
      "author": "Stride Lottie",
      "img": "assets/img/3.jpg"
    }
  ];

  final List bestArr = [
    {
      "name": "Fatherhood",
      "author": "by Christopher Wilson",
      "img": "assets/img/4.jpg",
      "rating": 5.0
    },
    {
      "name": "In A Land Of Paper Gods",
      "author": "by Rebecca Mackenzie",
      "img": "assets/img/5.jpg",
      "rating": 4.0
    },
    {
      "name": "Tattletale",
      "author": "by Sarah J. Noughton",
      "img": "assets/img/6.jpg",
      "rating": 3.0
    }
  ];

  final List genresArr = [
    {
      "name": "Graphic Novels",
      "img": "assets/img/g1.png",
    },
    {
      "name": "Graphic Novels",
      "img": "assets/img/g1.png",
    },
    {
      "name": "Graphic Novels",
      "img": "assets/img/g1.png",
    }
  ];

  final List recentArr = [
    {
      "name": "The Fatal Tree",
      "author": "by Jake Arnott",
      "img": "assets/img/10.jpg"
    },
    {
      "name": "Day Four",
      "author": "by LOTZ, SARAH",
      "img": "assets/img/11.jpg"
    },
    {
      "name": "Door to Door",
      "author": "by Edward Humes",
      "img": "assets/img/12.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                child: Transform.scale(
                  scale: 1.7,
                  origin: Offset(0, size.width * 0.85),
                  child: Container(
                    width: double.infinity,
                    height: size.width,
                    decoration: BoxDecoration(
                        color: TColor.primary,
                        borderRadius: BorderRadius.circular(size.width * 0.5)),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: size.width * 0.1,
                  ),
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leadingWidth: 1,
                    title: const Text(
                      'Our Top Picks',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                    leading: const SizedBox(),
                    actions: [
                      IconButton(
                          onPressed: () {
                            //..
                            sideMenuScaffoldKey.currentState!.openEndDrawer();
                          },
                          icon: const Icon(
                            Icons.menu,
                            size: 25,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: size.width * 0.15,
                  ),
                  SizedBox(
                    width: size.width,
                    height: size.width * 0.7,
                    child: CarouselSlider.builder(
                        options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            aspectRatio: 1,
                            enlargeFactor: 0.4,
                            viewportFraction: 0.4,
                            enlargeStrategy: CenterPageEnlargeStrategy.scale),
                        itemCount: topPicksArr.length,
                        itemBuilder: (context, index, realIndex) => TopPicsCell(
                            img: topPicksArr[index]['img'],
                            name: topPicksArr[index]['name'],
                            author: topPicksArr[index]['author'])),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'BestSelling',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: TColor.text),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: size.height * 0.33,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: bestArr.length,
                        itemBuilder: (context, index) => BestSellerCell(
                            rating: bestArr[index]['rating'],
                            img: bestArr[index]['img'],
                            name: bestArr[index]['name'],
                            author: bestArr[index]['author'])),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Text(
                        'Gener',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: TColor.text),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: size.height * 0.3,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: bestArr.length,
                        itemBuilder: (context, index) => GenerCell(
                              bgColor: index % 2 == 0
                                  ? TColor.color1
                                  : TColor.color2,
                              img: genresArr[index]['img'],
                              name: genresArr[index]['name'],
                            )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 25, left: 20, bottom: 10),
                      child: Text(
                        'Recent Viewd',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: TColor.text),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: size.height * 0.35,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: bestArr.length,
                        itemBuilder: (context, index) => RecentViewd(
                            img: recentArr[index]['img'],
                            name: recentArr[index]['name'],
                            author: recentArr[index]['author'])),
                  ),
                ],
              )
            ],
          )
        ],
      )),
    );
  }
}
