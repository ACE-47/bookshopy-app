import 'package:bookshopy_app/common_widget/liner_round_button.dart';
import 'package:bookshopy_app/common_widget/product_list.dart';
import 'package:bookshopy_app/provider/auth.dart';
import 'package:bookshopy_app/provider/cart.dart';
import 'package:bookshopy_app/provider/product.dart';
import 'package:bookshopy_app/provider/products.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/constants.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = 'product-detail';
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late CarouselController _controller;
  int page = 0;

  @override
  void didChangeDependencies() {
    _controller = CarouselController();

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  // final List<String> productImg = [
  //   'assets/img/ob3.png',
  //   'assets/img/ob3.png',
  //   'assets/img/ob3.png'
  // ];

  // final List purArr = [
  //   "assets/img/p1.jpg",
  //   "assets/img/p2.jpg",
  //   "assets/img/p3.jpg"
  // ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final auth = Provider.of<Auth>(context, listen: false);
    final productId = ModalRoute.of(context)!.settings.arguments as int;
    final product =
        Provider.of<Products>(context, listen: false).findById(productId);
    // print(product);
    final suggestionProducts = Provider.of<Products>(context, listen: false)
        .suggestionProducts(product.collection);

    final authorWorks = Provider.of<Products>(context, listen: false)
        .authorProducts(product.author['id']);
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
                onPageChanged: (index, reason) {
                  setState(() {
                    page = index;
                  });
                },
                // enlargeCenterPage: false,
                // // aspectRatio: 16 / 9,
                height: size.width * 0.5,
                // viewportFraction: 0.9,
                // enlargeFactor: 0.4,
                // enlargeStrategy: CenterPageEnlargeStrategy.scale
              ),
              itemCount: product.imageUrl.length,
              itemBuilder: (ctx, index, realIndex) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    product.imageUrl[index]['image'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      product.imageUrl.length,
                      (index) => Container(
                            width: 15,
                            height: 15,
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: page == index
                                    ? TColor.primary
                                    : TColor.subTitle,
                                borderRadius: BorderRadius.circular(25)),
                          ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceAro,
                        children: [
                          Flexible(
                            flex: 7,
                            fit: FlexFit.tight,
                            child: Text(
                              // overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              softWrap: true,
                              product.title,
                              style: TextStyle(
                                  color: TColor.text,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          // const SizedBox(
                          //   width: 2,
                          // ),
                          Flexible(
                            flex: 4,
                            fit: FlexFit.loose,
                            child: LinearRoundButton(
                                title: 'Add To Cart',
                                onPress: () {
                                  //
                                  Provider.of<Cart>(context, listen: false)
                                      .addToCart(productId, 1);
                                }),
                          ),
                          GestureDetector(
                            onTap: () {
                              //
                              Provider.of<Product>(context, listen: false)
                                  .toggleFavorite(productId, auth.accessTocken);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Icon(
                                // style: IconButton.styleFrom(
                                //     shape: BorderRadius.all(radius),),

                                Icons.favorite_border_sharp,
                                color: TColor.primary,
                                size: 32,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      softWrap: true,
                      product.description,
                      style: TextStyle(color: TColor.subTitle, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            //
            ProductList(
                productsList: suggestionProducts,
                title: 'Suggestions',
                onPress: () {}),

            //.
            ProductList(
                productsList: authorWorks,
                title: 'Author Works',
                onPress: () {}),
          ],
        )),
      ),
    );
  }
}
