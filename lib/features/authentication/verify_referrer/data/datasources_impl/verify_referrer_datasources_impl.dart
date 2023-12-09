import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/authentication/verify_referrer/data/index.dart';

class VerifyReferrerDatasourcesImpl extends VerifyReferrerDatasources {
  @override
  Future<BaseResponseWithObj> verifyReferrer(
      VerifyReferrerModelRequest dataRequest) async {
    Map<String, dynamic> queryParameters = {
      "phoneNum": dataRequest.phoneNumber,
    }..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(VerifyReferrerRequest(queryParameters: queryParameters));

    return BaseResponseWithObj.fromJson(res);
  }
}
