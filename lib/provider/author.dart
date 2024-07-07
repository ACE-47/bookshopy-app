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
  List<Author> _authors = [];
  List<Author> get authors {
    return [..._authors];
  }

  Future<void> fetchAndSetAuthors() async {
    Uri url = Uri.parse('http:http://10.21.55.93:8000/store/authors/');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List<dynamic>;
      // print(response.body);
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
      // print(loadedData[0].name);
      _authors = loadedData;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
