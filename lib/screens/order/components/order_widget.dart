import 'package:bookshopy_app/screens/order/components/order_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/constants.dart';
import '../../../provider/orders.dart';

class OrderW extends StatelessWidget {
  const OrderW({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 4,
      shadowColor: TColor.primaryLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: TColor.primaryLight,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            titleName('Order Number:  ', '${order.id}'),
            const SizedBox(height: 5),
            titleName('Order Date:  ',
                DateFormat('dd/MM/yyyy hh:mm').format(order.placeOrderDate)),
            const SizedBox(height: 5),
            titleName('Status:  ', order.status),
            const SizedBox(height: 12),
            titleName('Total:  \$', '${order.totalOrderPrice}'),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  Icons.remove_red_eye_outlined,
                  size: 16,
                  color: TColor.primary,
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    //
                    Navigator.of(context).pushNamed(OrderDetailScreen.routeName,
                        arguments: order.id);
                  },
                  child: Text(
                    'View Details',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: TColor.primary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Text titleName(String name, String value) {
    return Text.rich(
      TextSpan(
          text: name,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
          children: [
            TextSpan(
              text: ' $value',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ]),
    );
  }
}
