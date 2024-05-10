import 'dart:convert';

import 'package:flutter_clinic/domain/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasource {
  String authKey = 'auth-key';
  Future<bool> saveAuthData(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await prefs.setString(authKey, json.encode(user.toJson()));
    return result;
  }

  Future<User?> getAuthData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = prefs.getString(authKey);
    if (result != null) {
      return User.fromJson(json.decode(result));
    } else {
      return null;
    }
  }

  Future<bool> removeAuthData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.remove(authKey);
  }

  String tokenKey = 'token-key';
  Future<bool> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await prefs.setString(tokenKey, token);
    return result;
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = prefs.getString(tokenKey);
    return result;
  }

  Future<bool> removeToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.remove(tokenKey);
  }
}
