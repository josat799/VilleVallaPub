import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vvp/providers/user_credentials.dart';
import 'package:vvp/widgets/login.dart';
import 'package:vvp/widgets/main_layout.dart';

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
