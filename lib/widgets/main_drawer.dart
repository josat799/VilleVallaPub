import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vvp/providers/user.dart';
import 'package:vvp/screens/booking_screen.dart';
import 'package:vvp/screens/party_screen.dart';
import 'package:vvp/screens/settings_screen.dart';
import 'package:vvp/screens/statistics_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final loadedUser = Provider.of<User>(context);
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            height: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(loadedUser.name, style: TextStyle(fontSize: 24), textAlign: TextAlign.center,),
                FittedBox(child: Image.network(loadedUser.imageUrl), fit: BoxFit.cover,),
              ],
            ),
          ),
          Divider(),
          ListTile(
            title: Text("Boka Pass"),
            trailing: Icon(Icons.calendar_today),
            onTap: () => Navigator.of(context).pushNamed(BookingScreen.routeName),
          ),
          Divider(),
          ListTile(
            title: Text("Statistik"),
            trailing: Icon(Icons.trending_up),
            onTap: () => Navigator.of(context).pushNamed(StatisticScreen.routeName),
          ),
          Divider(),
          ListTile(
            title: Text("Festanmälan"),
            trailing: Icon(Icons.turned_in),
            onTap: () => Navigator.of(context).pushNamed(PartyScreen.routeName),
          ),
          Divider(),
          ListTile(
            title: Text("Settings"),
            trailing: Icon(Icons.settings),
            onTap: () => Navigator.of(context).pushNamed(SettingsScreen.routeName),
          ),
        ],
      ),
    );
  }
}
