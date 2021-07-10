import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences prefs;

Future<void> init() async {
  prefs = await SharedPreferences.getInstance();
}
