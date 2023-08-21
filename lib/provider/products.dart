import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/provider/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];
  List<Product> _frontItems = [];

  List<Product> get item {
    return [..._items];
  }

  List<Product> get frontItems {
    return [..._frontItems];
  }

  List<Collection> _collections = [];
  List<Collection> get collections {
    return [..._collections];
  }

  Future<void> fetchAndSetFrontProducts() async {
    Uri url = Uri.parse('http://10.21.140.237:8000/store/products_advertize/');

    try {
      final response = await http.get(url);
      final extractData = json.decode(response.body) as List<dynamic>;
      final List<Product> loadedData = [];
      for (var product in extractData) {
        loadedData.add(Product(
            id: product['product']['id'],
            title: product['product']['title'],
            price: product['product']['unit_price'],
            description: product['product']['descriptions'],
            imageUrl: product['product']['images'],
            collection: product['product']['collection'],
            author: product['product']['auther'],
            publisher: product['product']['publisher']['name'],
            inventory: product['product']['inventory']));
        // print(product);
      }
      print(loadedData[0].id);
      _frontItems = loadedData;
      notifyListeners();
    } catch (error) {
      //throw error
      rethrow;
    }
  }

  Future<void> fetchAndSetProducts() async {
    Uri url = Uri.parse('http://10.21.140.237:8000/store/products/');
    try {
      final response = await http.get(url);
      final extractData = json.decode(response.body) as List<dynamic>;
      final List<Product> loadedData = [];
      for (var product in extractData) {
        loadedData.add(Product(
            id: product['product']['id'],
            title: product['product']['title'],
            price: product['product']['unit_price'],
            description: product['product']['descriptions'],
            imageUrl: product['product']['images'],
            collection: product['product']['collection'],
            author: product['product']['auther'],
            publisher: product['product']['publisher']['name'],
            inventory: product['product']['inventory']));
        // print(product);
      }
      _items = loadedData;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> setAndFetchCollections() async {
    Uri url = Uri.parse('http://10.21.140.237:8000/store/collections/');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List<dynamic>;
      final List<Collection> loadedData = [];
      extractedData
          .map((collection) => loadedData.add(Collection(
              id: collection['collection']['id'],
              title: collection['collection']['title'])))
          .toList();
      _collections = loadedData;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == int.tryParse(id));
  }
}
