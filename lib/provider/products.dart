import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/provider/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];
  List<Product> _frontItems = [];
  List<Product> _recentAdded = [];

  List<Product> get item {
    return [..._items];
  }

  List<Product> get frontItems {
    return [..._frontItems];
  }

  List<Product> get recentAdded {
    return [..._recentAdded];
  }

  List<Collection> _collections = [];
  List<Collection> get collections {
    return [..._collections];
  }

  Future<void> fetchAndSetFrontProducts() async {
    Uri url = Uri.parse('http://10.23.154.10:8000/store/products_advertize/');

    try {
      final response = await http.get(url);
      final extractData = json.decode(response.body) as List<dynamic>;
      // print(extractData);
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
          inventory: product['product']['inventory'],
        ));
        // print(product);
      }
      // print(loadedData.length);
      _frontItems = loadedData;
      // print(_frontItems.length);
      notifyListeners();
    } catch (error) {
      //throw error
      rethrow;
    }
  }

  Future<void> fetchAndSetProducts() async {
    Uri url = Uri.parse(
        'http://10.23.154.10:8000/store/products/?ordering=-last_update');
    try {
      final response = await http.get(url);
      final extractData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedData = [];

      for (var product in extractData['results']) {
        loadedData.add(Product(
            id: product['id'],
            title: product['title'],
            price: product['unit_price'],
            description: product['descriptions'],
            imageUrl: product['images'],
            collection: product['collection'],
            author: product['auther'],
            publisher: product['publisher']['name'],
            inventory: product['inventory']));
        // print(product);
      }
      _items = loadedData;
      for (var i = 0; i < 10; i++) {
        _recentAdded.add(_items[i]);
      }
      // print(_items[0].id);
      print(_recentAdded.length);
      print(_items.length);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> setAndFetchCollections() async {
    Uri url = Uri.parse('http://10.23.154.10:8000/store/collections/');
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

  Product findById(int id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  List<Product> suggestionProducts(int collectionID) {
    return [..._items.where((prod) => prod.collection == collectionID)];
  }

  List<Product> AuthorProducts(int authorId) {
    return [..._items.where((prod) => prod.author['id'] == authorId)];
  }
}
