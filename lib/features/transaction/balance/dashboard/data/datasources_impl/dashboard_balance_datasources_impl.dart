import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

class DashboardBalanceDatasourcesImpl extends DashboardBalanceDatasources {
  @override
  Future<BaseResponseWithObj> getBalance() async {
    Map<String, dynamic> queryParameters = {}
      ..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(GetBalanceRequest(queryParameters: queryParameters));

    return BaseResponseWithObj.fromJson(res);
  }
}
