import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/authentication/index.dart';

class VerifyUserDatasourcesImpl extends VerifyUserDatasources {
  @override
  Future<BaseResponseWithObj> verifyUserExist(
      VerifyUserExistModelRequest dataRequest) async {
    Map<String, dynamic> queryParameters = {
      "areaCode": dataRequest.areaCode,
      "phoneNumber": dataRequest.phoneNumber,
    }..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(VerifyUserExistsRequest(queryParameters: queryParameters));

    return BaseResponseWithObj.fromJson(res);
  }
}
