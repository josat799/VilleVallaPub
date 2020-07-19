import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vvp/providers/pass.dart';
import 'package:vvp/providers/user.dart';
import 'package:vvp/widgets/main_layout.dart';

class BookingScreen extends StatelessWidget {
  static const routeName = "/booking";

  @override
  Widget build(BuildContext context) {
    final User loadedUser = Provider.of<User>(context);
    final loadedPass = Provider.of<BookablePass>(context);
    print(loadedPass.allPass.length);

    return mainLayout(
        body: ListView.builder(
            itemCount: loadedPass.allPass.length,
            itemBuilder: (ctx, i) {
              return Container(
                height: 100,
                child: Card(
                  elevation: 8,
                  child: Text(loadedPass.allPass[i].title),

                ),
              );
            }));
  }
}
