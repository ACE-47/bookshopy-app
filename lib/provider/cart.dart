import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CartItem with ChangeNotifier {
  final int id;
  final int productId;
  final String productTitle;
  final double productPrice;
  int quantity;
  double totalPrice;

  CartItem({
    required this.id,
    required this.productId,
    required this.productTitle,
    required this.productPrice,
    required this.quantity,
    required this.totalPrice,
  });

  void setQuantity(int oldQuantity, oldTotalPrice) {
    quantity = oldQuantity;
    totalPrice = oldTotalPrice;
    notifyListeners();
  }

  Future<void> updateQuantity(
      int cartItemId, int newQuantity, String authTocken) async {
    final prefs = await SharedPreferences.getInstance();
    final cartId = prefs.getString('cart_id');
    //
    final oldQuantity = quantity;
    final oldTotalPrice = totalPrice;
    quantity = newQuantity;
    totalPrice = productPrice * quantity;
    notifyListeners();

    Uri url = Uri.parse(
        'http://192.168.31.34:8000/store/carts/$cartId/items/$cartItemId/');
    try {
      final response = await http.patch(url,
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: 'JWT $authTocken',
          },
          body: json.encode({
            'quantity': quantity,
          }));
      // print(response.body);
      if (response.statusCode >= 400) {
        setQuantity(oldQuantity, oldTotalPrice);
      }
      // notifyListeners();
    } catch (error) {
      setQuantity(oldQuantity, oldTotalPrice);
    }
  }
}

class Cart with ChangeNotifier {
  final String authTocken;

  Cart(this.authTocken);

  final Map<String, dynamic> _items = {};

  Map<String, dynamic> get items {
    return {..._items};
  }

  // final String _cartId = '';
  // Future<String> get cartId async {
  //   return await checkCartId();
  // }

  double totalCartPrice = 0.0;

  void totalCartPriceFn() {
    double total = 0.0;
    final a = _items['items'] as List<CartItem>;
    for (var cartitem in a) {
      total += cartitem.totalPrice;
    }
    totalCartPrice = total;
    notifyListeners();
  }
  // double get totalCartPrice {
  //   double total = 0.0;

  //   final a = _items['items'] as List<CartItem>;
  //   for (var cartitem in a) {
  //     total += cartitem.totalPrice;
  //   }

  //   print(total);
  //   return total;
  // }

  Future<String> checkCartId() async {
    final prefs = await SharedPreferences.getInstance();
    var cartId = prefs.getString('cart_id');

    if (cartId == null) {
      Uri url = Uri.parse('http://192.168.31.34:8000/store/carts/');

      try {
        final response = await http.post(url);
        cartId = json.decode(response.body)['id'];
        prefs.setString('cart_id', cartId!);
        // print(response.body);
        notifyListeners();
      } catch (error) {
        rethrow;
      }
    }
    return cartId;
  }

  Future<void> fetchAndSetCart() async {
    var cartId = await checkCartId();
    // if (cartId.isEmpty) {

    // }
    print(cartId);
    Uri url = Uri.parse('http://192.168.31.34:8000/store/carts/$cartId/');
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<CartItem> loadedItems = [];
    // print(extractedData);
    // _items['id'] = extractedData['id'];
    _items['total_cart_price'] = extractedData['total_cart_price'];
    totalCartPrice =
        _items['total_cart_price'] == 0 ? 0.0 : _items['total_cart_price'];
    for (var cartItem in extractedData['items']) {
      loadedItems.add(CartItem(
          id: cartItem['id'],
          productId: cartItem['product']['id'],
          productTitle: cartItem['product']['title'],
          productPrice: cartItem['product']['unit_price'],
          quantity: cartItem['quantity'],
          totalPrice: cartItem['total_price']));
    }
    _items['items'] = loadedItems;
    notifyListeners();
    // CartItem a = _items['items'][0];
    // print(a);
  }

  Future<void> addToCart(int productId, int quantity) async {
    final cartId = await checkCartId();
    print(cartId);
    Uri url = Uri.parse('http://192.168.31.34:8000/store/carts/$cartId/items/');
    if (quantity == 0) {
      return;
    }
    try {
      final response = await http.post(url,
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: 'JWT $authTocken',
          },
          body: json.encode({
            'product_id': productId,
            'quantity': quantity,
          }));
      print(response.body);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> placeOrder() async {
    final cartId = await checkCartId();
    Uri url = Uri.parse('http://192.168.31.34:8000/store/orders/');
    try {
      final response = await http.post(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: 'JWT $authTocken',
      }, url, body: json.encode({"cart_id": cartId}));

      totalCartPrice = 0.0;
      final prefs = await SharedPreferences.getInstance();
      // prefs.setString('cart_id', '');
      _items.clear();
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
