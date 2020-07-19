import 'package:flutter/material.dart';
import 'package:vvp/widgets/main_layout.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = "/settings";

  @override
  Widget build(BuildContext context) {
    return mainLayout(
      body: null,
      appbar: AppBar(
        title: Text("Settings"),
      ),
      navigationBar: null,

    );
  }
}
