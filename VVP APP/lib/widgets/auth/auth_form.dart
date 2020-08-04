import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final void Function(String username, String password, BuildContext context) submitFunction;

  const AuthForm(this.submitFunction);


  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final FocusNode _passwordNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  var loginData = {
    "username": "",
    "password": "",
  };

  bool _showObscure = true;
  var _isLoading = false;

  _togglePassword() {
    setState(() {
      _showObscure = !_showObscure;
    });
  }


  _onSubmit() {
    final bool isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      setState(() {
        _isLoading = true;
      });
      widget.submitFunction(loginData["username"].trim().toLowerCase(), loginData["password"].trim(), context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 150,
                      child: Image.asset("assets/images/vvp_logo.png")),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Användarnamn",
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Lösenord",
                      suffixIcon: GestureDetector(
                        child: Icon(Icons.remove_red_eye),
                        onTap: () {
                          setState(() {
                            _togglePassword();
                          });
                        },
                      ),
                    ),
                    obscureText: _showObscure,
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      GestureDetector(
                        child: Text("Glömt Lösenord?"),
                        onTap: null,
                      ),
                      _isLoading ? CircularProgressIndicator() : RaisedButton(
                        color: Theme.of(context).accentColor,
                        onPressed: _onSubmit,
                        child: Text("Logga in"),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
