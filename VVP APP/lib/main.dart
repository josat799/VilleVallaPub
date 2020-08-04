import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter_appavailability/flutter_appavailability.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:vvp/providers/auth.dart';
import 'package:vvp/providers/pass.dart';
import 'package:vvp/screens/booking_screen.dart';
import 'package:vvp/screens/kjamiz_screen.dart';
import 'package:vvp/screens/login_screen.dart';
import 'package:vvp/screens/party_screen.dart';
import 'package:vvp/screens/settings_screen.dart';
import 'package:vvp/screens/splash_screen.dart';
import 'package:vvp/screens/statistics_screen.dart';
import './screens/home_screen.dart';
import './providers/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> getApps() async {
    List<Map<String, String>> _installedApps;

    if (Platform.isAndroid) {
      print(true);
      _installedApps = await AppAvailability.getInstalledApps();

      print(await AppAvailability.checkAvailability("se.bankgirot.swish"));
      // Returns: Map<String, String>{app_name: Chrome, package_name: com.android.chrome, versionCode: null, version_name: 55.0.2883.91}

      print(await AppAvailability.isAppEnabled("com.android.chrome"));
      // Returns: true
    }
  }

  @override
  Widget build(BuildContext context) {
    getApps();
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
          home: auth.isAuth() ? HomeScreen() : FutureBuilder(
            future: auth.tryAutoLogin(),
              builder: (ctx, authResultSnapshot) => authResultSnapshot.connectionState == ConnectionState.waiting ? SplashScreen() :  LoginScreen()),
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
