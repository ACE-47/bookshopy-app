import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Author {
  final int id;
  final String name;
  final String about;
  final DateTime birthDate;
  final String imageUrl;

  Author(
      {required this.id,
      required this.name,
      required this.about,
      required this.birthDate,
      required this.imageUrl});
}

class Authors with ChangeNotifier {
  final List<Author> _authors = [];
  List<Author> get authors {
    return [..._authors];
  }

  Future<void> fetchAndSetAuthors() async {
<<<<<<< HEAD
    Uri url = Uri.parse('http://10.23.154.10:8000/store/authors/');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List<dynamic>;
      print(response.body);
=======
    Uri url = Uri.parse('http://192.168.31.34:8000/store/authors/');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List<dynamic>;
      // print(response.body);
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
      final List<Author> loadedData = [];
      extractedData
          .map((author) => loadedData.add(Author(
                id: author['id'],
                name: author['name'],
                about: author['about'],
                birthDate: DateTime.parse(author['birth_date']),
                imageUrl: author['author_image'],
              )))
          .toList();
<<<<<<< HEAD
      print(loadedData[0].name);
=======
      // print(loadedData[0].name);
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
      authors = loadedData;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
