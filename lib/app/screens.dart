import "package:kari/app/screens/settings/Preferences-screen.dart";
import "package:kari/app/screens/settings/Profile-screen.dart";
import "package:kari/app/screens/auth/Login-screen.dart";
import 'package:flutter/widgets.dart';
import 'package:kari/app/screens/Home-Page.dart';

Map<String, Widget> screens = {
  "home":  HomePage(),
	"login": LoginScreen(),
	"profile": ProfileScreen(),
	"preference": PreferencesScreen(),
};