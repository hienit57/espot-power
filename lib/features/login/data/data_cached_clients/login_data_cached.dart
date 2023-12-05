import 'dart:convert';
import 'package:bas_clean_architecture/core/local_data/pref_cached_client.dart';
import 'package:bas_clean_architecture/core/local_data/pref_keys.dart';
import 'package:bas_clean_architecture/features/login/data/models/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataUserLoginCachedClient extends PrefCacheClient<LoginResponse> {
  DataUserLoginCachedClient._privateConstructor();

  static final DataUserLoginCachedClient instance =
      DataUserLoginCachedClient._privateConstructor();
  @override
  String get prefKey => PrefsKeys.loginDataUser.value;

  LoginResponse? loginResponse;

  @override
  Future<bool> storeData(LoginResponse? data) async {
    try {
      final pref = await SharedPreferences.getInstance();
      final encodedData = jsonEncode(data);
      return pref.setString(prefKey, encodedData);
    } catch (_) {
      return false;
    }
  }

  @override
  Future<LoginResponse?> getData() async {
    try {
      final pref = await SharedPreferences.getInstance();
      final prefData = pref.getString(prefKey) ?? '';
      if (prefData != '') {
        final data = jsonDecode(prefData) as Map<String, dynamic>;
        final response = LoginResponse.fromJson(data);
        loginResponse = response;
        return response;
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool> isExistItem(String key) {
    // TODO: implement isExistItem
    throw UnimplementedError();
  }

  @override
  Future<bool> isExistTable() async {
    return (await getData()) != null;
  }

  @override
  Future<bool> updateData(LoginResponse? data) {
    // TODO: implement updateData
    throw UnimplementedError();
  }
}
