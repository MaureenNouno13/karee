library core.controller;

import 'package:reflectable/reflectable.dart';
import 'package:kari/app/app.module.dart';
//import 'package:kari/core/controller/Controller.reflectable.dart';


class Controller extends Reflectable{
  static Map<String, InstanceMirror> reflectors = {};
  const Controller() : super(invokingCapability);
}

const Controller controller = Controller();


void initControllerReflectable(){
  /**
   * On souscrit les controller
   */
  for(dynamic control in controllers){
    Controller.reflectors[control.runtimeType.toString()] = controller.reflect(control);
   // print(Controller.reflectors[control.runtimeType.toString()].type.metadata);//('test', [{'context': null}]);// = controller.reflect(control);
  }
  print("Map of reflectee => ${Controller.reflectors}");
}


