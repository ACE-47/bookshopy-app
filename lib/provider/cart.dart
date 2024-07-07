import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CartItem with ChangeNotifier {
  final int id;
  final int? productID;
  final int? packageID;
  final String title;
  final double price;
  final String imgUrl;
  int quantity;
  double totalPrice;

  CartItem({
    required this.id,
    required this.productID,
    required this.packageID,
    required this.title,
    required this.price,
    required this.imgUrl,
    required this.quantity,
    required this.totalPrice,
  });

  void setQuantity(int oldQuantity, oldTotalPrice) {
    quantity = oldQuantity;
    totalPrice = oldTotalPrice;
    notifyListeners();
  }

  Future<void> updateQuantity(
      String cartId, int cartItemId, int newQuantity, String authTocken) async {
    // final prefs = await SharedPreferences.getInstance();
    // final cartId = prefs.getString('cart_id');
    //
    // double price2 = (totalPrice / quantity);
    // print(price2);
    final oldQuantity = quantity;
    final oldTotalPrice = totalPrice;
    quantity = newQuantity;
    totalPrice = price * quantity;
    // notifyListeners();

    Uri url = Uri.parse(
        'http://10.21.55.93:8000/store/carts/$cartId/items/$cartItemId/');
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
    notifyListeners();
  }
}

class Cart with ChangeNotifier {
  final String authTocken;

  Cart(this.authTocken);

  final Map<String, dynamic> _items = {};

  Map<String, dynamic> get items {
    return {..._items};
  }

  String _cartID = '';
  String get cartId {
    return _cartID;
  }
  // final String _cartId = '';
  // Future<String> get cartId async {
  //   return await checkCartId();
  // }

  double totalCartPrice = 0.0;

  void totalCartPriceFn() {
    double total = 0.0;
    final a = _items['items'] as List<CartItem>;
    for (var item in a) {
      total += item.totalPrice;
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

  Future<void> checkCartId() async {
    // final prefs = await SharedPreferences.getInstance();
    // var cartId = prefs.getString('cart_id');

    //
    Uri url = Uri.parse('http://10.21.55.93:8000/store/carts/');

    try {
      final response = await http.get(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: 'JWT $authTocken',
      }, url);
      // print(json.decode(response.body));
      if (json.decode(response.body).isEmpty) {
        final responseCart = await http.post(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: 'JWT $authTocken',
        }, url);

        _cartID = json.decode(responseCart.body)[0]['id'];
      } else {
        _cartID = json.decode(response.body)[0]['id'];
      }

      // prefs.setString('cart_id', cartId!);
      // print(response.body);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
    // return _cartID;
  }

  Future<void> fetchAndSetCart() async {
    await checkCartId();
    Uri url = Uri.parse('http://10.21.55.93:8000/store/carts/$_cartID/');

    print(_cartID);
    final response = await http.get(headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: 'JWT $authTocken',
    }, url);
    print(json.decode(response.body));
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<CartItem> loadedItems = [];
    // print(extractedData);
    // _items['id'] = extractedData['id'];
    _items['total_cart_price'] = extractedData['total_cart_price'];

    for (var cartItem in extractedData['items']) {
      loadedItems.add(CartItem(
          id: cartItem['id'],
          productID:
              cartItem['product'] == null ? null : cartItem['product']['id'],
          packageID:
              cartItem['package'] == null ? null : cartItem['package']['id'],
          title: cartItem['package_id'] == null
              ? cartItem['product']['title']
              : cartItem['package']['title'],
          price: cartItem['package_id'] == null
              ? cartItem['product']['unit_price']
              : cartItem['package']['unit_price'],
          imgUrl: cartItem['package_id'] == null
              ? cartItem['product']['image']
              : cartItem['package']['image'],
          quantity: cartItem['quantity'],
          totalPrice: cartItem['total_price']));
    }
    _items['items'] = loadedItems;
    totalCartPrice = _items['total_cart_price'];
    notifyListeners();
    // CartItem a = _items['items'][0];
    // print(a);
  }

  Future<void> addToCart(int? productId, int? packageId, int quantity) async {
    await checkCartId();
    // print(_cartID);
    Uri url = Uri.parse('http://10.21.55.93:8000/store/carts/$_cartID/items/');
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
            'package_id': packageId,
            'quantity': quantity,
          }));
      // print(response.body);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> placeOrder(Map<String, dynamic> address) async {
    await checkCartId();
    Uri url = Uri.parse('http://10.21.55.93:8000/store/orders/');
    try {
      final response = await http.post(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: 'JWT $authTocken',
          },
          url,
          body: json.encode({
            'cart_id': _cartID,
            'address': address,
          }));
      print(_cartID);
      print(address);
      print(json.decode(response.body));

      // totalCartPrice = 0.0;
      // final prefs = await SharedPreferences.getInstance();
      // prefs.setString('cart_id', '');
      if (response.statusCode >= 200) {
        _items.clear();
      }
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
