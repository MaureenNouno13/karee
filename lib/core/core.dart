library core;

import 'package:kari/app/routes/Routes.dart';
import 'package:kari/core/core.reflectable.dart';

import 'controller/Controller.dart';

export 'controller/Controller.dart';
export 'view/View.dart';

doRouting(String control, String method, dynamic params){
  try{
    print("Appel du controller $control et de sa methode $method, avec les arguments $params");
    print("Controller found = ${Controller.reflectors[control].type}");
    if(Controller.reflectors[control].hasReflectee){
      //Controller.reflectors.forEach((c, im){
      //  print("Controller = $c im = $im");
      //});
      Controller.reflectors[control].invoke(method, [params]);  
    
    }
  }catch (ex){
    print("error = $ex");
    print("Controller $control not define $method's method");
  }
}


initCore(){
  initializeReflectable();
  /**
   * On souscrit les route
   */
  registeredRoute();
  initControllerReflectable();
//  initViewReflectable();
}

main(){
//  initCore();
}