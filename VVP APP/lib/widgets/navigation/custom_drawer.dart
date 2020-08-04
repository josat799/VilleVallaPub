import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vvp/providers/auth/auth.dart';
import 'package:vvp/providers/user/user.dart';


class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            height: 75,
            child: Consumer<User>(
              builder: (ctx, user, _) {
                print(user.user);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(user.user.name, style: Theme.of(context).textTheme.headline1,),
                  Image.network(user.user.imageUrl),
                ],
              );},
            ),
          ),
          Divider(),
          ListTile(
            title: Text("Boka Pass"),
            trailing: Icon(Icons.calendar_today),
            onTap: () => null, ///Navigator.of(context).pushNamed(BookingScreen.routeName),
          ),
          Divider(),
          ListTile(
            title: Text("Statistik"),
            trailing: Icon(Icons.trending_up),
            onTap: () => null, // Navigator.of(context).pushNamed(StatisticScreen.routeName),
          ),
          Divider(),
          ListTile(
            title: Text("Festanmälan"),
            trailing: Icon(Icons.turned_in),
            onTap: () => null, // Navigator.of(context).pushNamed(PartyScreen.routeName),
          ),
          Divider(),
          ListTile(
            title: Text("Settings"),
            trailing: Icon(Icons.settings),
            onTap: () => null, // Navigator.of(context).pushNamed(SettingsScreen.routeName),
          ),
          Divider(),
          ListTile(
            title: Text("Logout"),
            trailing: Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed("/");
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}
