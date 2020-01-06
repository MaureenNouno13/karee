 

import "package:flutter/material.dart";
import "package:kari/core/core.dart";

@Screen("preference")
class PreferencesScreen extends StatefulWidget{
   @override
   _PreferencesScreenState createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: Center(
               child: Text("PreferencesScreen Works!!! :)")
           )
       );
   }

}
