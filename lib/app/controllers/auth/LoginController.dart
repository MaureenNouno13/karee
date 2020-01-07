import 'package:kari/app/services/PersonnelServices.dart';
import "package:kari/core/core.dart";
import 'package:kari/core/routes/Router.dart';

@controller
class LoginController{

  PersonnelService personnelService = PersonnelService();

   index(Map<Symbol, dynamic> arg){

     arg[#title] = "Login Page";
      arg[#countries] = personnelService.getCountries();

      view("login", arg[#context], RouteMode.PUSH, parameter: arg);
   }
}
