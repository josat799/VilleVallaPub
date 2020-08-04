import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:vvp/providers/auth/auth.dart';
import 'package:vvp/providers/news/news.dart';
import 'package:vvp/providers/user/user.dart';
import 'package:vvp/screens/auth/auth_screen.dart';
import 'package:vvp/screens/news/news_screen.dart';
import 'package:vvp/screens/splash_screen.dart';


class VVPColors {
  static const Color VVP_RED = Color.fromRGBO(186, 22, 28, 1);
  static const Color VVP_YELLOW = Color.fromRGBO(255, 188, 17, 1);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProvider (
          create: (_) => User(),
        ),
        ChangeNotifierProvider(
          create: (_) => News(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'VilleValla Pub',
          theme: ThemeData(
            primaryColor: VVPColors.VVP_RED,
            backgroundColor: VVPColors.VVP_RED,
            accentColor: VVPColors.VVP_YELLOW,
            fontFamily: 'Georgia',
            textTheme: TextTheme(
              bodyText1: TextStyle(fontSize: 18.0),
              headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              headline2: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              headline3: TextStyle(fontSize: 8.0, fontWeight: FontWeight.bold),
              subtitle1: TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
            ),
            buttonTheme: ButtonTheme.of(context).copyWith(
              buttonColor: VVPColors.VVP_YELLOW,
              textTheme: ButtonTextTheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: auth.isAuth()
              ? NewsScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : AuthScreen()),
        ),
      ),
    );
  }
}
