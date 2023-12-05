import 'package:shared_preferences/shared_preferences.dart';

mixin PreferencesUtil {
  Future<bool> prefSetString(String key, String? value) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(key, value ?? '');
  }

  Future<bool> prefSetInt(String key, int? value) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setInt(key, value ?? 0);
  }

  Future<String> prefGetString(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(key) ?? '';
  }

  Future<int> prefGetInt(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getInt(key) ?? 0;
  }

  Future<bool> prefClear() async {
    final pref = await SharedPreferences.getInstance();
    return pref.clear();
  }
}
