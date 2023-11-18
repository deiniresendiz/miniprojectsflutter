import 'package:shared_preferences/shared_preferences.dart';

class LocalStorenge {
  static late SharedPreferences pref;

  static Future<void> configurePreferences() async {
    pref = await SharedPreferences.getInstance();
  }
}
