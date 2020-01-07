 

import "package:flutter/material.dart";
import "package:kari/core/core.dart";

@Screen("login")
class LoginScreen extends StatefulWidget{
   @override
   _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

   @override
   Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context).settings.arguments;
       return Scaffold(
            appBar: AppBar(
              title: Text(args[#title]),
            ),
            body: ListView.builder(
              itemCount: args[#countries].length,
              itemBuilder: (_, index) => Text(args[#countries][index]),
            ),
       );
   }

}
