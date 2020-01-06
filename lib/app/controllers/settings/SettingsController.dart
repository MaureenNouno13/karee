import "package:kari/core/core.dart";
import 'package:kari/core/routes/Router.dart';

@controller
class SettingsController{
   String index(Map<Symbol, dynamic> arg){
       return "Hello Welcome to SettingsController";
   }

  void loadProfile(Map<Symbol, dynamic> params){
    view("profile", params[#context], RouteMode.PUSH);
  }

  void loadPreference(Map<Symbol, dynamic> params){
    view("preference", params[#context], RouteMode.PUSH);
  }
}
