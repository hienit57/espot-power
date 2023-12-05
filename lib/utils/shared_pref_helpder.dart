import 'package:espot_power/core/local_data/pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static Future<bool> saveFcmToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(PrefsKeys.deviceToken.value, token);
  }

  static Future<String> getFcmToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(PrefsKeys.deviceToken.value) ?? '';
  }

  static Future<bool> saveAccessToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(PrefsKeys.accessToken.value, token);
  }

  static Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(PrefsKeys.accessToken.value);
  }

  static Future<bool> saveViewOnboarding(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(PrefsKeys.isViewOnboarding.value, value);
  }

  static Future<bool> getViewOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(PrefsKeys.isViewOnboarding.value) ?? false;
  }
}
