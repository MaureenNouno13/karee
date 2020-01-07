
import 'package:flutter/material.dart';
import 'package:kari/app/screens/Home-screen.dart';
//import 'package:kari/app/controllers/HomeController.dart';
import 'package:kari/core/core.dart';
import 'package:reflectable/reflectable.dart';

import 'core/routes/Router.dart';

//void main() => runApp(MyApp());


void main(){  
    //Controller.init();
  
    //print(caller.call("toMap", [{"nom": "Champlain N. Bakop"}]));
    //print(caller.call("salutation", ["Champlain N. Bakop"]));
    //print(caller.call("chanter", ["Singuila Jaloux"]));
    
    initCore();
    //initializeReflectable();
    runApp(MyApp());
 //   print(reflect(MyApp()));
  }
  
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Router.appRoute,
      home: HomeScreen()
    );
  }
}