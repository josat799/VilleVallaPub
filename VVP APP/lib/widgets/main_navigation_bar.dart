import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vvp/screens/kjamiz_screen.dart';

import '../providers/user.dart';

class MainNavigationBar extends StatefulWidget {
  @override
  _MainNavigationBarState createState() => _MainNavigationBarState();
}

class _MainNavigationBarState extends State<MainNavigationBar> {
  @override
  Widget build(BuildContext context) {
    _showUserDialog(BuildContext context) {
      showModalBottomSheet(
          context: context,
          builder: (_) {
            final loadedUser = Provider.of<User>(context, listen: false);
            return Center(
              child: Row(
                children: <Widget>[
                  Text(loadedUser.userStatus),
                  Text(ModalRoute.of(context).settings.name),
                ],
              ),
            );
          });
    }

    final currentPage = ModalRoute.of(context).settings.name;
    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                    icon: Icon(currentPage == "/" ? Icons.people : Icons.arrow_back),
                    onPressed: () => _changePage(currentPage)),
                SizedBox(width: 100),
                IconButton(icon: Icon(Icons.menu), onPressed: () => Scaffold.of(context).openEndDrawer()),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => _showUserDialog(context),
            child: Container(
                height: 125,
                width: 125,
                child: Image.asset("./assets/images/vvp_logo.png")),
          ),
        ],
      ),
    );
  }

  _changePage(String currentPage) {
    setState(() {
      print(currentPage == KjamizScreen.routeName);
      if (currentPage != "/") {
        Navigator.of(context).pop();
      } else {
        Navigator.of(context).pushNamed(KjamizScreen.routeName);
      }
    });
  }
}
