import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_application/core/app_urls.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Map<String, dynamic>? _userData;
  Map<String, dynamic> get userData => _userData ?? {};

  _setLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<bool> register(Map<String, dynamic> data) async {
    try {
      _setLoader(true);
      http.Response response = await http.post(
        Uri.parse(AppUrls.registerUserURL),
        body: data,
      );
      var jsonData = jsonDecode(response.body);
      // if response status code is  200
      if (response.statusCode == 200) {
        _userData = jsonData ;
        _setLoader(false);
        return true;
      } else {
        print(jsonData['desc'] ?? 'Something went wrong');
        _setLoader(false);
        return false;
      }
    } catch (e) {
      print(e.toString());
      _setLoader(false);
      return false;
    }
  }
}
