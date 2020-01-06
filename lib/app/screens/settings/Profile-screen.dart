 

import "package:flutter/material.dart";
import "package:kari/core/core.dart";

@Screen("profile")
class ProfileScreen extends StatefulWidget{
   @override
   _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: Center(
               child: Text("ProfileScreen Works!!! :)")
           )
       );
   }

}
