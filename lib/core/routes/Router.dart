library core.route;

import 'package:flutter/cupertino.dart' as cupertino;
import 'package:kari/app/app.module.dart';

import '../core.dart';


enum RouteMode{
  REPLACE,
  PUSH,
  POP,
  STAY,
  EMPTY
}


  class Route{
    static Map<String, dynamic> routeMap = {};

    static void data(String s, dynamic action ) {
      assert(s != null && action != null);
      routeMap[s] = action;
    }
    
  }

  void view(String name, cupertino.BuildContext context, RouteMode mode, {dynamic parameter, }){
    print("params for routing = $parameter");
    switch(mode){
      case RouteMode.REPLACE:
        cupertino.Navigator.pushReplacementNamed(context, name, arguments: parameter);
        break;
      case RouteMode.POP:
        cupertino.Navigator.of(context).pop(name);
        break;
      case RouteMode.PUSH:
        cupertino.Navigator.of(context).pushNamed(name, arguments: parameter);
        break;
      case RouteMode.EMPTY:
        cupertino.Navigator.of(context).pushNamedAndRemoveUntil(name, (_)=>false, arguments: parameter);
        break;
      default: cupertino.Navigator.of(context).pop(false);
    }
  }


class Router {

  static cupertino.BuildContext context;

  static dynamic goto(String routeName, {cupertino.BuildContext context, RouteMode mode, dynamic parameter}) {
    dynamic action = Route.routeMap[routeName];
    print("route name = $routeName with params = $parameter");
    if(action != null){
      print("test type de d'action = $action");
      if(action is Function){
        if(parameter == null){
          print("No params for action");
          return action();
        }else
          return action(parameter);
      }else if(action is String){
        List<String> li= action.split('@');
        if(li.length == 2){
          String controllerName = li[0];
          String methodName = li[1];
          print("controller = $controllerName method = $methodName");
          doRouting(controllerName, methodName, parameter);
        }
      }
    }else{
      print('No action for this route');
    }

  }


  static get getRouter => (cupertino.RouteSettings rs)=>appRoute(rs);

  static cupertino.Route<dynamic> appRoute(cupertino.RouteSettings settings) {
    try{ 
      return new RouteTransition(builder: (_)=>screens[settings.name], settings: settings);
    }catch(e){
      return new RouteTransition(builder: (_){
        return cupertino.Center(
          child: cupertino.Text("No Route found")
        );
        ///routes[RouteMode.ROUTE_404]
      }, settings: settings);
    }
  }

  static cupertino.Widget componentForRouteName(String s) => screens[s];

  static goBack(cupertino.BuildContext context) {
    cupertino.Navigator.of(context).pop(true);
  }

}

class RouteTransition<T> extends cupertino.CupertinoPageRoute<T> {
  RouteTransition({cupertino.WidgetBuilder builder, cupertino.RouteSettings settings})
      : super(builder: builder, settings: settings, maintainState: true);

  @override
  cupertino.Widget buildTransitions(cupertino.BuildContext context, cupertino.Animation<double> animation,
      cupertino.Animation<double> secondaryAnimation, cupertino.Widget child) {
//    if (settings.isInitialRoute) return child;
    return new cupertino.CupertinoPageTransition(child: child, linearTransition: false, primaryRouteAnimation: animation, secondaryRouteAnimation: secondaryAnimation);
  }
}
