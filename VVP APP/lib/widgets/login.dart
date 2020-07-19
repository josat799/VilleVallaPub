import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vvp/providers/auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  SharedPreferences sp;
  final FocusNode _passwordNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  var loginData = {
    "username": "",
    "password": "",
  };

  openBrowserTab() async {
    await FlutterWebBrowser.openWebPage(url: "https://villevallapub.se/login/forgot");
  }

  @override
  void dispose() {
    _passwordNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> _onSubmit() async {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      Scaffold.of(context).removeCurrentSnackBar();
      Scaffold.of(context).showSnackBar(
        SnackBar(
            duration: Duration(seconds: 2),
            content: Text("Något verkar inte riktigt stämma")),
      );
      return;
    }
    _formKey.currentState.save();
    // TODO: Edit later to check with server
    await Provider.of<Auth>(context, listen: false).signIn(loginData["username"], loginData["password"]);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
              height: 150,
              width: 150,
              child: FittedBox(
                  child: Image.asset("./assets/images/vvp_logo.png"))),
          TextFormField(
            decoration: InputDecoration(labelText: "Användarnamn"),
            onSaved: (value) {
              loginData["username"] = value;
            },
            validator: (value) {
              if (value.isEmpty) {
                return 'Fyll i användarnamn';
              }
              return null;
            },
            initialValue: loginData["username"],
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_passwordNode);
            },
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(labelText: "Lösenord"),
            initialValue: loginData["password"],
            validator: (value) {
              if (value.isEmpty) {
                return 'Fyll i lösenord';
              }
              return null;
            },
            onFieldSubmitted: (_) {
              _onSubmit();
            },
            focusNode: _passwordNode,
            textInputAction: TextInputAction.done,
            onSaved: (value) {
              loginData["password"] = value;
            },
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  child: Text("Glömt lösenord?"),
                  onTap: openBrowserTab,
                ),
                RaisedButton(
                  onPressed: _onSubmit,
                  child: Text('Logga in'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
