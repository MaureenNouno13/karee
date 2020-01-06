import 'package:kari/core/routes/Router.dart';


void registeredRoute(){

  Route.data("/home", "HomeController@test");

  Route.data("/salutation", (){
    print("Je suis dans salutation");
    return "Bonjour le monde";
  });

  Route.data("/login", "LoginController@index");
  
  Route.data("/settings/profile", "SettingsController@loadProfile");
  Route.data("/settings/preference", "SettingsController@loadPreference");

  Route.data("/merci", (Map<Symbol, dynamic> arg){
    print(Router.goto("/salutation"));
    print("Nom = ${arg[#nom]}");
    view("home", arg[#context], RouteMode.PUSH);
    return Router.goto("/salutation"); 
  });

}