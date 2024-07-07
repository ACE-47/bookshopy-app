import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/provider/cart.dart';

import '../../../common/constants.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.authTocken,
    // required this.img,
    // required this.price,
    // required this.title,
    // required this.amount,
    // required this.cartItemId,
  });

  // final int cartItemId;
  final String authTocken;
  final String img = 'assets/img/3.jpg';
  // final double price;
  // final String title;
  // int amount;

  // price: cart.items['items'][index].productPrice,
  @override
  Widget build(BuildContext context) {
    final cartItem = Provider.of<CartItem>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: TColor.text.withOpacity(0.15)),
        borderRadius: BorderRadius.circular(15),
      ),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.title,
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
                      text: '\$${cartItem.price}',
                      style: TextStyle(
                        color: TColor.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                      children: [
                        TextSpan(
                          // change it later with promotion
                          text: '  \$${cartItem.price}',
                          style: TextStyle(
                            color: TColor.subTitle,
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                          ),
                        ),
                      ]),
                ),
                const SizedBox(height: 10),
                Text('total price = ${cartItem.totalPrice}')
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Icon(
                    Icons.arrow_drop_up,
                    color: TColor.text,
                  ),
                  onTap: () async {
                    // amount += 1;

                    try {
                      await Provider.of<CartItem>(context, listen: false)
                          .updateQuantity(
                              cartItem.id, cartItem.quantity += 1, authTocken);
                      // .then((_) => Provider.of<Cart>(context, listen: false)
                      //     .totalCartPriceFn());
                    } catch (error) {
                      //do error handler
                      print(error);
                    }
                  },
                ),
                const SizedBox(height: 8),
                Text(
                  "${cartItem.quantity}",
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
                  onTap: () async {
                    try {
                      await Provider.of<CartItem>(context, listen: false)
                          .updateQuantity(
                              cartItem.id, cartItem.quantity -= 1, authTocken);
                      // .then((_) => Provider.of<Cart>(context, listen: false)
                      //     .totalCartPriceFn());
                    } catch (error) {
                      print(error);
                    }
                  },
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
