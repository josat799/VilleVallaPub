import 'package:flutter/material.dart';
import 'package:vvp/models/users/worker.dart';
import 'package:vvp/providers/auth/auth.dart';
import 'package:vvp/providers/user/user.dart';
import 'package:vvp/widgets/auth/auth_form.dart';
import 'package:provider/provider.dart';


class AuthScreen extends StatelessWidget {

  Future<void> authenticate(String username, String password, BuildContext context) async {
    Provider.of<Auth>(context, listen: false).signIn(username, password);
    Provider.of<User>(context, listen: false).selectUser(Worker("1", "Josef Atoui"));
    Provider.of<User>(context, listen: false).updateUser("https://res.cloudinary.com/hsocx4wtk/image/upload/c_fit,q_60,w_400/rudwuu2mrpvlotmfjt49");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthForm(authenticate),
    );
  }
}
