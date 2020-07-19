import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vvp/providers/auth.dart';
import 'package:vvp/providers/pass.dart';
import 'package:vvp/screens/booking_screen.dart';
import 'package:vvp/screens/kjamiz_screen.dart';
import 'package:vvp/screens/login_screen.dart';
import 'package:vvp/screens/party_screen.dart';
import 'package:vvp/screens/settings_screen.dart';
import 'package:vvp/screens/statistics_screen.dart';
import 'package:vvp/providers/user_credentials.dart';

import './screens/home_screen.dart';
import './providers/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth(),),
        ChangeNotifierProvider(create: (_) => User(),),
        ChangeNotifierProvider(create: (_) => BookablePass(),),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: "VilleValla Pub",
          home: auth.isAuth() ? HomeScreen() : LoginScreen(),
          routes: {
            KjamizScreen.routeName: (_) => KjamizScreen(),
            BookingScreen.routeName: (_) => BookingScreen(),
            SettingsScreen.routeName: (_) => SettingsScreen(),
            PartyScreen.routeName: (_) => PartyScreen(),
            StatisticScreen.routeName: (_) => StatisticScreen(),
          },
        ),
      ),
    );
  }
}
