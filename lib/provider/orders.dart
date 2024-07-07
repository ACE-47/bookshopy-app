import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OrderItem {
  final int productId;
  final String productTitle;
  final double productPrice;
  final int quantity;
  final double totalPrice;

  OrderItem({
    required this.productId,
    required this.productTitle,
    required this.productPrice,
    required this.quantity,
    required this.totalPrice,
  });
}

class Order {
  final int id;
  final List<OrderItem> items;
  final DateTime placeOrderDate;
  final double totalOrderPrice;
  final String status;

  Order({
    required this.status,
    required this.id,
    required this.items,
    required this.placeOrderDate,
    required this.totalOrderPrice,
  });
}

class Orders with ChangeNotifier {
  final List<Order> _orders = [];

  Orders(this.authTocken);

  List<Order> get orders {
    return [..._orders];
  }

  final String authTocken;

  Future<void> fetchAndSetOrders() async {
    Uri url = Uri.parse('http://10.21.55.93:8000/store/orders/');
    try {
      final response = await http.get(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: 'JWT $authTocken',
      }, url);
      print(json.decode(response.body));

      final extractedData = json.decode(response.body) as List<dynamic>;
      for (var order in extractedData) {
        _orders.add(Order(
            status: order['payment_status'],
            id: order['id'],
            items: (order['items'] as List<dynamic>)
                .map((orderItem) => OrderItem(
                    productId: orderItem['product']['id'],
                    productTitle: orderItem['product']['title'],
                    productPrice: orderItem['product']['unit_price'],
                    quantity: orderItem['quantity'],
                    totalPrice: orderItem['total_price']))
                .toList(),
            placeOrderDate: DateTime.parse(order['placed_at']),
            totalOrderPrice: order['total_order_price']));
      }

      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Order findById(int id) {
    return _orders.firstWhere((ord) => ord.id == id);
  }
}
