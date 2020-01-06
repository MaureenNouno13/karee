import "package:kari/core/core.dart";
import 'package:kari/core/routes/Router.dart';

@controller
class LoginController{
   index(Map<Symbol, dynamic> arg){
       print("Hello Welcome to LoginController");
      view("login", arg[#context], RouteMode.PUSH, parameter: arg);
   }
}
