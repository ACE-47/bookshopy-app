import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PackageItem {
  final int id;
  final int prodId;
  final String title;
  final String description;
  final int quantity;

  PackageItem({
    required this.id,
    required this.prodId,
    required this.title,
    required this.description,
    required this.quantity,
  });
}

class Package {
  final int id;
  final String title;
  final double price;
  final String description;
  final List<PackageItem> items;

  Package({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.items,
  });
}

class Packages with ChangeNotifier {
  final String authTocken;

  Packages(this.authTocken);

  final List<Package> _items = [];

  List<Package> get items {
    return [..._items];
  }

  Future<void> fetchPackages() async {
    Uri url = Uri.parse('http://10.21.55.93:8000/store/packages/');

    try {
      final response = await http.get(
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: 'JWT $authTocken',
        },
        url,
      );
      final extractedData = json.decode(response.body) as List<dynamic>;
      for (var package in extractedData) {
        _items.add(
          Package(
              id: package['id'],
              title: package['title'],
              price: package['price'],
              description: package['descriptions'],
              items: (package['items'] as List<dynamic>)
                  .map(
                    (item) => PackageItem(
                        id: item['id'],
                        prodId: item['product']['id'],
                        title: item['product']['title'],
                        description: item['product']['description'],
                        quantity: item['quantity']),
                  )
                  .toList()),
        );
      }
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
