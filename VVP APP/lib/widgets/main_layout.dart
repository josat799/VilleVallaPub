import 'package:flutter/material.dart';
import 'package:vvp/widgets/main_drawer.dart';
import 'package:vvp/widgets/main_navigation_bar.dart';

Scaffold mainLayout(
    {@required Widget body, AppBar appbar, BottomNavigationBar navigationBar, Drawer drawer}) {
  return Scaffold(
    body: body,
    appBar: appbar == null ? null : appbar,
    bottomNavigationBar:
        navigationBar == null ? MainNavigationBar() : navigationBar,
    endDrawer: drawer == null ? MainDrawer() : null,
  );
}
