

import 'package:flutter/cupertino.dart';
import 'package:kari/core/core.dart';

@Screen("login")
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Login page"),
    );
  }
}