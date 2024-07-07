<<<<<<< HEAD
import 'package:flutter/material.dart';
=======
import 'package:bookshopy_app/provider/cart.dart';
import 'package:provider/provider.dart';
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8

import '../../../common/constants.dart';

class CheckoutCartButton extends StatelessWidget {
<<<<<<< HEAD
  const CheckoutCartButton({super.key, required this.totalPrice});
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
=======
  const CheckoutCartButton({
    super.key,
    // required this.totalPrice
  });
  // final double totalPrice;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final totalPrice = cart.totalCartPrice;
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
    return Container(
      width: double.infinity,
      height: 80,
      // color: Colors.black12,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(right: 5, left: 5, bottom: 10, top: 2),
      decoration: BoxDecoration(
        // color: Colors.black12.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        // border: Border.all(width: 1, color: TColor.primary),
        // boxShadow: [
        //   BoxShadow(
        //       color: TColor.primaryLight.withOpacity(0.7),
        //       spreadRadius: 0.5,
        //       offset: Offset(0, 2)),
        // ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text.rich(
              TextSpan(text: "Total\n", children: [
                TextSpan(
<<<<<<< HEAD
                  text: "\$$totalPrice",
=======
                  text: "\$ $totalPrice",
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ]),
            ),
          ),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 2,
                  backgroundColor: TColor.primary),
<<<<<<< HEAD
              onPressed: () {},
=======
              onPressed: () async {
                // await cart.placeOrder();
              },
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
              child: const Text(
                textAlign: TextAlign.center,
                'Chckout',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
