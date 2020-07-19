import 'package:shared_preferences/shared_preferences.dart';

class UserCredentials {
  static getUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  static setUsername(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("username", username);
  }
}
