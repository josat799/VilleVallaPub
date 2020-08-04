import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static Future<void> setUser(
      String userId, String username, String token, DateTime expiryDate) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
        'userData',
        json.encode({
          'username': username,
          'userId': userId,
          'token': token,
          'expiryDate': DateTime.now().toIso8601String(),
        }));

  }

  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString('userData'))['userId'];
  }

  static Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString('userData'))['username'];
  }

  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString('userData'))['token'];
  }

  static Future<DateTime> getExpiryDate() async {
    final prefs = await SharedPreferences.getInstance();
    return DateTime.parse(
        json.decode(prefs.getString('userData'))['expiryDate']);
  }

  static Future<bool> isInitialized() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('userData')) {
      return true;
    }
    return false;
  }

  static Future<void> clearEntries() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
