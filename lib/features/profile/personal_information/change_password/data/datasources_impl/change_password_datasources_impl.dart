import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

class ChangePasswordDatasourcesImpl extends ChangePasswordDatasources {
  @override
  Future<BaseResponseWithObj> changePassword(
      ChangePasswordModelRequest dataRequest) async {
    Map<String, dynamic> queryParameters = {
      "originalPwd": dataRequest.oldPassword,
      "newPwd": dataRequest.newPassword,
    }..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(ChangePasswordRequest(queryParameters: queryParameters));

    return BaseResponseWithObj.fromJson(res);
  }
}
