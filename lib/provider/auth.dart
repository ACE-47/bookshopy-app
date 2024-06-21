import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String _accessTocken = '';
  String _refreshTocken = '';
  String _password = '';
  String _userName = '';
  DateTime _expiryDate = DateTime.now();
  late Timer _authTimer;

  Map<String, String> header = {
    HttpHeaders.contentTypeHeader: "application/json",
  };

  bool get isAuth {
    return accessTocken != '';
  }

  String get accessTocken {
    if (_expiryDate != DateTime.now() &&
        _expiryDate.isAfter(
          DateTime.now(),
        )) {
      return _accessTocken;
    }
    return '';
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }

    final userData = json.decode(prefs.getString('userData')!);
    // print(userData);
    final DateTime expiryDate = DateTime.parse(userData['expiryDate']);
    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }

    _accessTocken = userData['access'];
    _refreshTocken = userData['refresh'];
    _userName = userData['username'];
    _password = userData['password'];
    _expiryDate = expiryDate;
    notifyListeners();
    autoLogOut();
    return true;
  }

  Future<void> logOut() async {
    _accessTocken = '';
    _refreshTocken = '';
    _userName = '';
    _password = '';
    _expiryDate = DateTime.now();
    _authTimer.cancel();
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
  }

  void autoLogOut() {
    final timeToExpire = _expiryDate.difference(DateTime.now()).inDays;
    _authTimer = Timer(Duration(days: timeToExpire), logOut);
  }

  Future<void> signUp({
    required String userName,
    required String password,
    required String email,
    required String firstName,
    required String lastName,
  }) async {
    Uri url = Uri.parse('http://192.168.31.34:8000/auth/users/');

    try {
      final response = await http.post(
        url,
        headers: header,
        body: json.encode({
          "username": userName,
          "password": password,
          "email": email,
          "first_name": firstName,
          "last_name": lastName
        }),
      );
      final extractData = json.decode(response.body) as Map<String, dynamic>;

      if (response.statusCode == HttpStatus.badRequest) {
        throw extractData;
      }

      _userName = extractData['username'];
      _password = password;
      notifyListeners();
      return logIn(userName, password);
      // return log(userName, password);
      // print(extractData);
      // print(response.body);
    } catch (error) {
      // print(error);
      rethrow;
    }
  }

  Future<void> logIn(String userName, String password) async {
    Uri url = Uri.parse('http://192.168.31.34:8000/auth/jwt/create/');

    try {
      final response = await http.post(
        url,
        headers: header,
        body: json.encode({
          "username": userName,
          "password": password,
        }),
      );

      final extractData = json.decode(response.body);
      if (response.statusCode == HttpStatus.unauthorized) {
        throw extractData['detail'];
      }
      // print(extractData);
      // print(extractData['access']);
      // print(extractData['refresh']);

      _accessTocken = extractData['access']!;
      _refreshTocken = extractData['refresh']!;
      _expiryDate = DateTime.now().add(const Duration(days: 7));
      autoLogOut();
      // print(_accessTocken);
      // print(_refreshTocken);

      final prefs = await SharedPreferences.getInstance();

      final userData = json.encode({
        'username': userName,
        'password': password,
        'access': _accessTocken,
        'refresh': _refreshTocken,
        'expiryDate': _expiryDate.toIso8601String(),
      });
      prefs.setString('userData', userData);
      notifyListeners();
    } catch (error) {
      // print(error);

      rethrow;
    }
  }
}
