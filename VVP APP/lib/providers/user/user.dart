import 'package:flutter/material.dart';
import 'package:vvp/models/users/user.dart' as modelUser;


class User with ChangeNotifier {
  modelUser.User _user;

  void selectUser(modelUser.User user) {
    _user = user;
    notifyListeners();
  }

  void unselectUser() {
    _user = null;
    notifyListeners();
  }

  modelUser.User get user {
    return _user;
  }

  updateUser(String imageUrl) {
    _user.imageUrl = imageUrl;
    notifyListeners();
  }
}