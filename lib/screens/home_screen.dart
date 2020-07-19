import 'package:flutter/material.dart';
import 'package:vvp/widgets/home.dart';
import 'package:vvp/widgets/main_drawer.dart';
import 'package:vvp/widgets/main_layout.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return mainLayout(
      body: Home(),
      );
  }
}
