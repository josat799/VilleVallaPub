import 'package:flutter/material.dart';
import 'package:vvp/widgets/login.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 100, left: 10, right: 10),
          child: Login()),
    );
  }
}
