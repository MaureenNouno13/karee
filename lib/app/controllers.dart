import "package:kari/app/controllers/settings/SettingsController.dart";
import "package:kari/app/controllers/auth/LoginController.dart";
import 'package:kari/app/controllers/HomeController.dart';
import 'package:kari/app/controllers/TotoController.dart';

List<dynamic> controllers = [
  HomeController(),
  TotoController(),
	LoginController(),
	SettingsController(),
];