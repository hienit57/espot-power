import 'package:espot_power/core/local_data/pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static Future<void> clearAppData() async {
    await _prefsInstance?.clear();
    return;
  }

  static Future<void> clearData() async {
    await saveAccessToken('');
    return;
  }

  static Future<bool> saveFcmToken(String token) async {
    var prefs = await _instance;
    return prefs.setString(PrefsKeys.deviceToken.value, token);
  }

  static Future<String> getFcmToken() async {
    var prefs = await _instance;
    return prefs.getString(PrefsKeys.deviceToken.value) ?? '';
  }

  static Future<bool> saveAccessToken(String token) async {
    var prefs = await _instance;
    return prefs.setString(PrefsKeys.accessToken.value, token);
  }

  static Future<String?> getAccessToken() async {
    var prefs = await _instance;
    return prefs.getString(PrefsKeys.accessToken.value);
  }

  static Future<bool> saveViewOnboarding(bool value) async {
    var prefs = await _instance;
    return prefs.setBool(PrefsKeys.isViewOnboarding.value, value);
  }

  static Future<bool> getViewOnboarding() async {
    var prefs = await _instance;
    return prefs.getBool(PrefsKeys.isViewOnboarding.value) ?? false;
  }
}
