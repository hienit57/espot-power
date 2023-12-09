import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/models/index.dart';

class UserManualDatasourcesImpl extends UserManualDatasources {
  @override
  Future<BaseResponseWithPagination> getUserManual(
      UserManualModelRequest dataRequest) async {
    Map<String, dynamic> queryParameters = {
      "pageNo": dataRequest.skip ?? 1,
      "pageSize": dataRequest.take ?? 10,
      "type": dataRequest.type,
    }..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(GetUserManualRequest(queryParameters: queryParameters));

    return BaseResponseWithPagination<ManualResponse>.fromJson(
        res, (json) => ManualResponse.fromJson(json as Map<String, dynamic>));
  }
}
