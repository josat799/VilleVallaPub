import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vvp/widgets/navigation/custom_bottom_navigationbar.dart';
import 'package:vvp/widgets/navigation/custom_drawer.dart';


class CustomLayout extends StatelessWidget {
  Widget body;


  CustomLayout(this.body);


  _showUserDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Column(
          children: <Widget>[
            Center(
              child: Text(
                "Kryss",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Container(
              height: 50,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, i) => Container(
                  child: IconButton(color: Colors.yellow, icon: i % 2 == 0 ? FaIcon(FontAwesomeIcons.utensils) : FaIcon(FontAwesomeIcons.beer), onPressed: null),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text("Du är aktiv"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      endDrawer: CustomDrawer(),
      bottomNavigationBar: CustomBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 100,
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          clipBehavior: Clip.none,
          onPressed: () => _showUserDialog(context),
          child: Image.asset("./assets/images/vvp_logo.png"),
        ),
      ),
    );
  }
}