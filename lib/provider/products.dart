import 'dart:convert';
<<<<<<< HEAD
=======
import 'dart:io';
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/provider/product.dart';

class Products with ChangeNotifier {
<<<<<<< HEAD
  final List<Product> _items = [];
  final List<Product> _frontItems = [];
  final List<Product> _recentAdded = [];

  List<Product> get item {
=======
  final String authTocken;

  Products(this.authTocken);

// items list products
  List<Product> items = [];
  List<Product> frontItems = [];
  final List<Product> recentAdded = [];

// favorite item
  List<Product> favorites = [];

  List<Product> get favorites {
    return [...favorites];
  }

  List<Product> get item {
    if (favorites.isNotEmpty) {}
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
    return [...items];
  }

  List<Product> get frontItems {
    return [...frontItems];
  }

  List<Product> get recentAdded {
    return [...recentAdded];
  }

  List<Collection> collections = [];
  List<Collection> get collections {
    return [...collections];
  }

<<<<<<< HEAD
  Future<void> fetchAndSetFrontProducts() async {
    Uri url = Uri.parse('http://10.23.154.10:8000/store/products_advertize/');
=======
  Future<void> fetchAndSetFavoriteProduct() async {
    Uri url = Uri.parse('http://192.168.31.34:8000/like/likedItem/');

    try {
      final response = await http.get(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: 'JWT $authTocken',
      }, url);
      print(authTocken);
      // print(json.decode(response.body));
      final extractedData = json.decode(response.body) as List<dynamic>;
      final List<Product> loadedData = [];
      for (var favoriteProd in extractedData) {
        loadedData.add(Product(
          id: favoriteProd['product']['id'],
          title: favoriteProd['product']['title'],
          price: favoriteProd['product']['unit_price'],
          description: favoriteProd['product']['descriptions'],
          imageUrl: favoriteProd['product']['images'],
          collection: favoriteProd['product']['collection'],
          author: favoriteProd['product']['auther'],
          publisher: favoriteProd['product']['publisher']['name'],
          // inventory: favoriteProd['product']['inventory'],
          isFavorate: true,
        ));
      }
      favorites = loadedData;
      // print(_favorites);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> fetchAndSetFrontProducts() async {
    Uri url = Uri.parse('http://192.168.31.34:8000/store/products_advertize/');
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8

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
<<<<<<< HEAD
          inventory: product['product']['inventory'],
=======
          // inventory: product['product']['inventory'],
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
        ));
        // print(product);
      }
      // print(loadedData.length);
      frontItems = loadedData;
      // print(_frontItems.length);
      notifyListeners();
    } catch (error) {
      //throw error
      rethrow;
    }
  }

  Future<void> fetchAndSetProducts() async {
    Uri url = Uri.parse(
<<<<<<< HEAD
        'http://10.23.154.10:8000/store/products/?ordering=-last_update');
=======
        'http://192.168.31.34:8000/store/products/?ordering=-last_update')
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
    try {
      final response = await http.get(url);
      final extractData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedData = [];

      for (var product in extractData['results']) {
        loadedData.add(Product(
<<<<<<< HEAD
            id: product['id'],
            title: product['title'],
            price: product['unit_price'],
            description: product['descriptions'],
            imageUrl: product['images'],
            collection: product['collection'],
            author: product['auther'],
            publisher: product['publisher']['name'],
            inventory: product['inventory']));
=======
          id: product['id'],
          title: product['title'],
          price: product['unit_price'],
          description: product['descriptions'],
          imageUrl: product['images'],
          collection: product['collection'],
          author: product['auther'],
          publisher: product['publisher']['name'],
          // inventory: product['inventory']
        ))
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
        // print(product);
      }
      items = loadedData;
      for (var i = 0; i < 10; i++) {
        recentAdded.add(items[i]);
      }
      // print(_items[0].id);
<<<<<<< HEAD
      print(recentAdded.length);
      print(items.length);
=======
      // print(_recentAdded.length);
      // print(_items.length);
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> setAndFetchCollections() async {
<<<<<<< HEAD
    Uri url = Uri.parse('http://10.23.154.10:8000/store/collections/');
=======
    Uri url = Uri.parse('http://192.168.31.34:8000/store/collections/');
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List<dynamic>;
      final List<Collection> loadedData = [];
      extractedData
          .map((collection) => loadedData.add(Collection(
              id: collection['collection']['id'],
              title: collection['collection']['title'])))
          .toList();
      collections = loadedData;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Product findById(int id) {
    return items.firstWhere((prod) => prod.id == id);
  }

  List<Product> suggestionProducts(int collectionID) {
    return [...items.where((prod) => prod.collection == collectionID)];
  }

<<<<<<< HEAD
  List<Product> AuthorProducts(int authorId) {
=======
  List<Product> authorProducts(int authorId) {
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
    return [...items.where((prod) => prod.author['id'] == authorId)];
  }
}
