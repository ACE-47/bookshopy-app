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
  final String img = 'assets/img/3.jpg';

  late Future _cartFuture;

  Future _obtainCartFuture() {
    return Provider.of<Cart>(context, listen: false).fetchAndSetCart();
  }

  @override
  void initState() {
    _cartFuture = _obtainCartFuture();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              // height: size.height * 0.7,
              width: double.infinity,
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
            ),
          ],
        ),
      ),
    );
  }
}
