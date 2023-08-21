import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../common/constants.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = 'product-detail';
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late CarouselController _controller;

  @override
  void didChangeDependencies() {
    _controller = CarouselController();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  final List<String> productImg = [
    'assets/img/ob3.png',
    'assets/img/ob3.png',
    'assets/img/ob3.png'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            CarouselSlider.builder(
              carouselController: _controller,
              options: CarouselOptions(
                autoPlay: true,
onPageChanged: (index, reason) => ,
                // enlargeCenterPage: false,
                // // aspectRatio: 16 / 9,
                height: size.width * 0.5,
                // viewportFraction: 0.9,
                // enlargeFactor: 0.4,
                // enlargeStrategy: CenterPageEnlargeStrategy.scale
              ),
              itemCount: productImg.length,
              itemBuilder: (ctx, index, realIndex) => Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    productImg[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      productImg.length,
                      (index) => Container(
                            width: 15,
                            height: 15,
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: TColor.primary,
                                borderRadius: BorderRadius.circular(25)),
                          ))
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
