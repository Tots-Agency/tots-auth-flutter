import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tots_auth/src/entities/tots_user_entity.dart';

class TotsAuth {

  static Future<String?> getBearerToken() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('TOTS_AUTH_BEARER_TOKEN');
  }
  
  static Future<void> removeBearerToken() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('TOTS_AUTH_BEARER_TOKEN');
  }

  static Future<void> saveBearerToken(String token) async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('TOTS_AUTH_BEARER_TOKEN', token);
  }

  static Future<TotsUser?> getUser() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('TOTS_AUTH_USER');

    if(data == null){
      return null;
    }

    return TotsUser.fromJson(jsonDecode(data));
  }
  
  static Future<void> removeUser() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('TOTS_AUTH_USER');
  }

  static Future<void> saveUser(TotsUser user) async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('TOTS_AUTH_USER', user.toJsonString());
  }

  static Future<void> logout() async {
    await removeBearerToken();
    await removeUser();
  }
}