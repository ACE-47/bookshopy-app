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
    Uri url = Uri.parse('http://10.21.140.237:8000/store/authors/');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List<dynamic>;
      final List<Author> loadedData = [];
      extractedData
          .map((author) => loadedData.add(Author(
                id: author['author']['id'],
                name: author['author']['title'],
                about: author['author']['about'],
                birthDate: DateTime.parse(author['author']['birth_date']),
                imageUrl: author['author']['author_image'],
              )))
          .toList();
      _authors = loadedData;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
