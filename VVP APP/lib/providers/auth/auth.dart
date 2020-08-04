import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vvp/helpers/sp_helper.dart';

class Auth with ChangeNotifier {
  String _userId;
  String _username;
  String _token;
  DateTime _expiryDate;
  Timer _authTimer;

  Future<void> signIn(String username, String password) async {
    _username = username;

    //TODO: Do internet stuff here
    _expiryDate = DateTime.now().add(Duration(seconds: 500));
    _token = "123";
    _userId = "2609";
    if (username == "josat" && password == "123") {
      print("hejsan");
      await SharedPreferencesHelper.setUser(_userId, _username, _token, _expiryDate);
    }
    _autoLogout();
    notifyListeners();
  }

  bool isAuth()  {
    return _token != null;
  }


  String get token {
      if (_expiryDate != null &&
          _expiryDate.isAfter(DateTime.now()) &&
          token != null) {
        return token;
    }
    return null;
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer.cancel();
    }
    final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }

  Future<void> logout() async {
    _userId = null;
    _token = null;
    _expiryDate = null;
    if (_authTimer != null) {
      _authTimer.cancel();
      _authTimer = null;
    }
    notifyListeners();
    print(await SharedPreferencesHelper.isInitialized());
    SharedPreferencesHelper.clearEntries();
  }

  Future<bool> tryAutoLogin() async {
    print("test");
    if (!await SharedPreferencesHelper.isInitialized()) {
      print("hej");
      return false;
    }
    _expiryDate = await SharedPreferencesHelper.getExpiryDate();
    _token = await SharedPreferencesHelper.getToken();
    _userId = await SharedPreferencesHelper.getUserId();

    print(_token + " " + _userId + " " + _expiryDate.toIso8601String());
    if (_token == null && _expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    _autoLogout();
    notifyListeners();
    return true;
  }

}
