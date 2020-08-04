import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user.dart';

class Kjamiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loadedUser = Provider.of<User>(context);
    final mediaQuery = MediaQuery.of(context);
    return Container(
      padding: EdgeInsets.only(top: mediaQuery.padding.top, left: 10, right: 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(loadedUser.name, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,)),
          GestureDetector(child: Text(loadedUser.phoneNumber,), onTap: () {},)
        ],
      ),
    );
  }
}
