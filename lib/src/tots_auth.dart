import 'package:shared_preferences/shared_preferences.dart';

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
}