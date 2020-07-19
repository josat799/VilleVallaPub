import 'package:flutter/material.dart';
import 'package:vvp/widgets/kjamiz.dart';
import 'package:vvp/widgets/main_layout.dart';
import 'package:vvp/widgets/main_navigation_bar.dart';

class KjamizScreen extends StatelessWidget {
  static const routeName = "/kjamiz";
  @override
  Widget build(BuildContext context) {
    return mainLayout(body: Kjamiz());

  }
}
