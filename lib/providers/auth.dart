import 'package:flutter/cupertino.dart';

class Auth extends ChangeNotifier {
  String _userId;
  String _token;
  DateTime _expiryDate;

  bool isAuth() {
    return token != null;
}

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<void> signIn(String username, String password) async {
    if (username == "josat" && password == "123") {
      _userId = "123";
      _token = "123";
      _expiryDate = DateTime.now().add(Duration(seconds: 200));
      notifyListeners();
    }
  }
}