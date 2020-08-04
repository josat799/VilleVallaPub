import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      child: BottomNavigationBar(
        backgroundColor: Theme.of(context).accentColor,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text("")),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), title: Text("")),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), title: Text("")),
          BottomNavigationBarItem(
              icon: GestureDetector(child: Icon(Icons.menu), onTap: Scaffold.of(context).openEndDrawer,), title: Text("")),
        ],
      ),
    );
  }
}
