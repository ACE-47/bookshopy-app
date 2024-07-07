import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final int id;
  final String title;
  final double price;
  final String description;
  final List<dynamic> imageUrl; // change it idiot
  final int collection; // change it idiot
  final Map<String, dynamic> author; // change it idiot
  final String publisher;
  // final int inventory;
  bool isFavorate;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.collection,
    required this.author,
    required this.publisher,
    // required this.inventory,
    this.isFavorate = false,
  });

  void _setFavValue(bool newValue) {
    isFavorate = !isFavorate;
    notifyListeners();
  }

  Future<void> toggleFavorite(int productId, String authTocken) async {
    final oldStatus = isFavorate;
    isFavorate = !isFavorate;

    notifyListeners();

    Uri url = Uri.parse('http://10.21.55.93:8000/like/likedItem/');

    try {
      final response = await http.post(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: 'JWT $authTocken',
          },
          url,
          body: json.encode(
            {
              'product_id': productId,
            },
          ));

      if (response.statusCode >= 400) {
        // isFavorate = oldStatus;
        // notifyListeners();
        _setFavValue(oldStatus);
      }
    } catch (error) {
      // isFavorate = oldStatus;
      // notifyListeners();
      _setFavValue(oldStatus);
    }
  }
}

class Collection {
  final int id;
  final String title;

  Collection({required this.id, required this.title});
}
