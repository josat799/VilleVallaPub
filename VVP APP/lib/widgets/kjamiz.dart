import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user.dart';

class Kjamiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loadedUser = Provider.of<User>(context);
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        _buildHeader(loadedUser.name, loadedUser.phoneNumber),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildImage(loadedUser.imageUrl),
            Text(
              "Achievements",
            )
          ],
        ),
        Text(
          "KjamizFakta",
          style: TextStyle(fontSize: 32),
        ),
        ListView.builder(
            itemCount: loadedUser.kjamizFakta.length, itemBuilder: (ctx, i) {
              String key = loadedUser.kjamizFakta[i].toString();
              print(key);
          return ListTile();
        }),
      ],
    );
  }

  Container _buildHeader(String name, String phoneNumber) {
    return Container(
        width: double.infinity,
        height: 50,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(name, style: TextStyle(fontSize: 30)),
              Text(phoneNumber, style: TextStyle(fontSize: 30)),
            ],
          ),
        ));
  }

  Widget _buildImage(String imageUrl) {
    return Container(
      width: 150,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Image.network(imageUrl),
      ),
    );
  }
}
