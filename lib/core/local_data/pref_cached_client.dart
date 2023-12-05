import 'package:shared_preferences/shared_preferences.dart';

abstract class PrefCacheClient<T> {
  String get prefKey;

  Future<bool> storeData(T? data);

  Future<T?> getData();

  Future<bool> updateData(T? data);

  Future<bool> isExistItem(String key);

  Future<bool> isExistTable();

  Future<bool> deleteData() async {
    return (await SharedPreferences.getInstance()).remove(prefKey);
  }
}
