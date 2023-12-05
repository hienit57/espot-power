import 'package:cached_network_image/cached_network_image.dart';
import 'package:bas_clean_architecture/core/local_data/pref_keys.dart';
import 'package:bas_clean_architecture/utils/shared_pref_helpder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsDataCleaner {
  static final PrefsDataCleaner _singleton = PrefsDataCleaner._internal();

  factory PrefsDataCleaner() {
    return _singleton;
  }

  PrefsDataCleaner._internal();

  Future<dynamic> clearLocalData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.remove(PrefsKeys.userProfile.value);
      prefs.remove(PrefsKeys.appointments.value);
      prefs.remove(PrefsKeys.invoices.value);
      prefs.remove(PrefsKeys.accessToken.value);

      return;
    } catch (e) {
      return;
    }
  }

  cleanAllData() async {
    final currentFcmToken = await SharedPrefsHelper.getFcmToken();
    (await SharedPreferences.getInstance()).clear();
    await SharedPrefsHelper.saveFcmToken(currentFcmToken);
  }

  cleanNetworkImage(String url) async {
    await CachedNetworkImage.evictFromCache(url);
  }
}
