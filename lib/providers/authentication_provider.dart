import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_application/core/app_urls.dart';
import 'package:movie_application/core/user_preferences.dart';
import '../model/user_model.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  UserModel? _user;

  UserModel? get user => _user;

  UserPreferences _userpreferences = UserPreferences();
  bool isLoggedIn = false;

  _setLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<bool> register(Map<String, dynamic> data) async {
    try {
      _setLoader(true);
      final response = await http.post(
        Uri.parse(AppUrls.registerUserURL),
        body: data,
      );
      final jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        _user = UserModel.fromJson(jsonData);
        _setLoader(false);
        return true;
      } else {
        throw Exception(jsonData['desc'] ?? 'Something went wrong');
      }
    } catch (e) {
      print(e.toString());
      _setLoader(false);
      return false;
    }
  }

  Future<bool> login(Map<String, dynamic> data) async {
    try {
      _setLoader(true);
      final response = await http.post(
        Uri.parse(AppUrls.loginUserURL),
        body: data,
      );
      final jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        _user = UserModel.fromJson(jsonData);
        _userpreferences.saveUser(_user!);

        _setLoader(false);
        return true;
      } else {
        throw Exception(jsonData['desc'] ?? 'Something went wrong');
      }
    } catch (e) {
      print(e.toString());
      _setLoader(false);
      return false;
    }
  }

  Future<void> getUserData() async {
    _setLoader(true);
    _user = await _userpreferences.getUser();
    if (_user?.email != null) {
      isLoggedIn = true;
    } else {
      isLoggedIn = false;
    }
    _setLoader(false);
  }
}
