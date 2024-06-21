import 'package:bookshopy_app/common/constants.dart';
import 'package:bookshopy_app/provider/orders.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrderDetailScreen extends StatelessWidget {
  static const routeName = '/order-detail';
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderId = ModalRoute.of(context)!.settings.arguments as int;
    final orderDate =
        Provider.of<Orders>(context, listen: false).findById(orderId);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: TColor.primary),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Order Info',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              orderInfoHeader('Order Number', '${orderDate.id}'),
              // const SizedBox(height: 3),
              orderInfoHeader(
                  'Order Date',
                  DateFormat('dd/MM/yyyy hh:mm')
                      .format(orderDate.placeOrderDate)),
              // const SizedBox(height: 3),
              orderInfoHeader('Payment Status', orderDate.status),
              const SizedBox(height: 5),

              orderParagraph('Order Products Details'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                // margin: const EdgeInsets.only(bottom: 5),
                // width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: orderDate.items.length,
                  itemBuilder: (ctx, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        orderProductsInfo('Product Name:  ',
                            orderDate.items[index].productTitle),
                        orderProductsInfo('Product Price:  ',
                            '\$ ${orderDate.items[index].productPrice}'),
                        orderProductsInfo('Quantity:  ',
                            '${orderDate.items[index].quantity}'),
                        orderProductsInfo('Subtotal Price:  ',
                            '\$ ${orderDate.items[index].totalPrice}'),
                      ],
                    ),
                  ),
                ),
              ),
              orderParagraph('Billing Address Details'),
            ],
          ),
        ),
      ),
    );
  }

  Container orderParagraph(
    String title,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: TColor.primaryLight,
      ),
      child: Text(
        title,
        style: TextStyle(
          // fontFamily: 'SF Pro Text',
          color: TColor.text,
          fontSize: 24,
          // fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Padding orderProductsInfo(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(
            child: Text(
              maxLines: 2,
              softWrap: true,
              value,
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }

  Padding orderInfoHeader(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            maxLines: 2,
            softWrap: true,
            value,
            style: const TextStyle(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
