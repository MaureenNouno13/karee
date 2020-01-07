 

import "package:flutter/material.dart";
import "package:kari/core/core.dart";
import 'package:kari/core/routes/Router.dart';

@Screen("/")
class HomeScreen extends StatefulWidget{
   @override
   _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   @override
   Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.teal,
          body:Container(
            padding: EdgeInsets.only(top: 15),
            child: Column(
              children: <Widget>[
                Container(
                  height: 45,
                  child: Center(child: Text("Welcome to Karee MVC", style: TextStyle(color: Colors.white),)),
                ),
                Container(
                  height: MediaQuery.of(context).size.height-60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: FlatButton(
                      child: Text("Login Now!"),
                      onPressed: () => Router.goto("/login", parameter: {#context: context, #nom: 'Karee'})
                    ),
                  ),
                )
              ],
            ),
          )
      );
   }

}
