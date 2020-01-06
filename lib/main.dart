
import 'package:flutter/material.dart';
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
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Router.appRoute,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  
  
  void _incrementCounter() {
    
    //print(doReflect(19));
    //print(doReflectM(context));
    
    //HomeController().runtimeType.noSuchMethod(Invocation.method(#test, []));
    //Router.goto(context, "/", RouteMode.PUSH, parameter: context);
    print(Router.goto("/login", parameter: {#context: context, #nom: 'Champlain is Happy'}));
    //print(Router.goto("/merci", parameter: {#nom:'Marius', #context:context}));
    //view("home", context, RouteMode.PUSH, parameter: context);
    //Reflectable.getInstance(HomeController().runtimeType).reflect(HomeController()).invoke("test", [{'context':  context}]);
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Edit Profile"),
              onPressed: () => Router.goto("/settings/profile", parameter: {#context: context}),
            ),
            RaisedButton(
              child: Text("Edit Preferences"),
              onPressed: () => Router.goto("/settings/preference", parameter:{#context: context}),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class MyReflectable extends Reflectable {
  const MyReflectable() : super(invokingCapability);
}

class MyMirror extends Reflectable{
  const MyMirror() : super(invokingCapability);
}


const myReflectable = const MyReflectable();
const myMirror =  const MyMirror();

@myMirror
class Mirrir{
  Mirrir();
  String danser(dynamic c){ 
    return "Je suis la fonction danser $c";
  }
  void courir(){
    print("Je cours vite");
  }
}

@myReflectable
class A {
  A(this.value);

  int value;
  int arg0() => value;
  int arg1(int x) => x - value;
  int arg1to3(int x, int y, [int z = 0, w]) => x + y + z * value;
  int argNamed(int x, int y, {int z: 42}) => x + y - z;
  int operator +(x) => value + x;
  int operator [](x) => value + x;
  void operator []=(x, v) { f = x + v; }
  int operator -() => -f;
  int operator ~() => f + value;

  int f = 0;

  static int noArguments() => 42;
  static int oneArgument(x) => x - 42;
  static int optionalArguments(x, y, [z = 0, w]) => x + y + z * 42;
  static int namedArguments(int x, int y, {int z: 42}) => x + y - z;
}

String doReflectM(BuildContext context){
  Mirrir inst = new Mirrir();
  InstanceMirror instanceMirror = myMirror.reflect(inst);
  //return myMirror.reflect(Mirrir()).invoke("danser", [context]);
  instanceMirror.invoke("courir", []);
  return instanceMirror.invoke("danser", [context]);
}

String doReflect(int i) {
  List<int> result = [];

  // Get hold of a few mirrors.
  A instance = new A(i);
  InstanceMirror instanceMirror = myReflectable.reflect(instance);
  ClassMirror classMirror = myReflectable.reflectType(A);

  // Invocations of methods accepting positional arguments.
  result.add(instanceMirror.invoke("arg0", []));
  result.add(instanceMirror.invoke("arg1", [84]));
  result.add(instanceMirror.invoke("arg1to3", [40, 2]));
  result.add(instanceMirror.invoke("arg1to3", [1, -1, 1]));
  result.add(instanceMirror.invoke("arg1to3", [21, 21, 0, "foo"]));

  // Invocations of methods accepting named arguments.
  result.add(instanceMirror.invoke("argNamed", [55, 29]));
  result.add(instanceMirror.invoke("argNamed", [21, 21], {#z: 0}));

  // Invocations of operators.
  result.add(instanceMirror.invoke("+", [42])); // '84'.
  result.add(instanceMirror.invoke("[]", [42])); // '84'.
  instanceMirror.invoke("[]=", [1, 2]);
  result.add(instance.f); // '3'.
  result.add(instanceMirror.invoke("unary-", [])); // '-3'.
  result.add(instanceMirror.invoke("~", [])); // '5'.

  // Similar invocations on static methods.
  result.add(classMirror.invoke("noArguments", []));
  result.add(classMirror.invoke("oneArgument", [84+i]));
  result.add(classMirror.invoke("optionalArguments", [40, i]));
  result.add(classMirror.invoke("optionalArguments", [1, -1, i]));
  result.add(classMirror.invoke("optionalArguments", [21, i, 0, "foo"]));
  result.add(classMirror.invoke("namedArguments", [55, 29 + i]));
  result.add(classMirror.invoke("namedArguments", [21, 21], {#z: i}));

  return result.toString();
}

