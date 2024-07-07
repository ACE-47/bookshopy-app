<<<<<<< HEAD
import 'package:bookshopy_app/screens/cart/components/checkout_cart_button.dart';
import 'package:flutter/material.dart';

import '../../common/constants.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  CartScreen({super.key});
  final String cartId = 'sslll';
  final String title = 'haider mohammed mohsen mohammed';
  int amount = 2;
  double price = 25;
  final String img = 'assets/img/3.jpg';

=======
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../common/constants.dart';
import '../main_tab/main_tab_screen.dart';
import '/provider/cart.dart';
import '/screens/cart/components/checkout_cart_button.dart';

import 'components/cartItem_widget.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  const String img = 'assets/img/3.jpg';

  late Future cartFuture;

  Future _obtainCartFuture() {
    return Provider.of<Cart>(context, listen: false).fetchAndSetCart();
  }

  @override
  void initState() {
    cartFuture = _obtainCartFuture();
    // TODO: implement initState
    super.initState();
  }

>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
<<<<<<< HEAD
      bottomNavigationBar: const CheckoutCartButton(totalPrice: 660.98),
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
=======
      bottomNavigationBar: const CheckoutCartButton(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     color: TColor.primary,
        //   ),
        // ),
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
<<<<<<< HEAD
            const Text(
              'Your Cart',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
=======
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Your Cart',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        //..
                        // Scaffold.maybeOf(context)!.openEndDrawer();
                        sideMenuScaffoldKey.currentState!.openEndDrawer();
                      },
                      icon: Icon(
                        size: 25,
                        Icons.menu,
                        color: TColor.primary,
                      )),
                ],
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              // height: size.height * 0.7,
              width: double.infinity,
<<<<<<< HEAD
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  // physics: const BouncingScrollPhysics(),
                  itemCount: 7,
                  itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: TColor.text.withOpacity(0.15)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              // flex: 8,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          img,
                                          fit: BoxFit.contain,
                                          // width: 100,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          title,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text.rich(
                                          TextSpan(
                                              text: '\$$price',
                                              style: TextStyle(
                                                color: TColor.primary,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: '  \$$price',
                                                  style: TextStyle(
                                                    color: TColor.subTitle,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                      // flex: ,
                                      child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 2,
                                      vertical: 20,
                                    ),
                                    // margin: const EdgeInsets.symmetric(
                                    //     horizontal: 5),
                                    decoration: BoxDecoration(
                                      color: TColor.text.withOpacity(0.05),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          child: Icon(
                                            Icons.arrow_drop_up,
                                            color: TColor.text,
                                          ),
                                          onTap: () {
                                            amount += 1;
                                          },
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          "$amount",
                                          style: TextStyle(
                                            color: TColor.primary,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        InkWell(
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            color: TColor.text,
                                          ),
                                          onTap: () {
                                            amount -= 1;
                                          },
                                        ),
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
=======
              // child: ListView.builder(
              //   physics: const BouncingScrollPhysics(),
              //   shrinkWrap: true,
              //   padding: const EdgeInsets.symmetric(vertical: 16),
              //   // physics: const BouncingScrollPhysics(),
              //   itemCount: 7,
              //   itemBuilder: (context, index) => CartItemWidget(
              //       img: img, price: price, title: title, amount: amount),
              // ),
              child: FutureBuilder(
                future: _cartFuture,
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.error != null) {
                      // show somthing
                      return const Center(
                        child: Text('something went wrong'),
                      );
                    } else {
                      final cart = Provider.of<Cart>(context);
                      final cartsItems = cart.items['items'] as List<CartItem>;

                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        // physics: const BouncingScrollPhysics(),
                        itemCount: cartsItems.length,
                        itemBuilder: (ctx, index) =>
                            ChangeNotifierProvider.value(
                          value: cartsItems[index],
                          child: CartItemWidget(
                            authTocken: cart.authTocken,
                            // cartItemId: cart.items['items'][index].id,
                            // img: img,
                            // price: cart.items['items'][index].productPrice,
                            // title: cart.items['items'][index].productTitle,
                            // amount: cart.items['items'][index].quantity,
                          ),
                        ),
                      );
                    }
                  }
                },
              ),
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
            ),
          ],
        ),
      ),
    );
  }
}
