import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

class DashboardProfileDatasourcesImpl extends DashboardProfileDatasources {
  @override
  Future<BaseResponseWithObj> getUserProfile() async {
    Map<String, dynamic> queryParameters = {}
      ..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(GetUserProfileRequest(queryParameters: queryParameters));

    return BaseResponseWithObj.fromJson(res);
  }
}
