import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

class VerifyOtpDatasourcesImpl extends VerifyOtpDatasources {
  @override
  Future<BaseResponseWithObj> verifyOtpSignup(
      VerifyOtpDataRequest dataRequest) async {
    Map<String, dynamic> queryParameters = {
      "account": dataRequest.phoneNumber,
      "verifyCodes": dataRequest.verifyCode,
    }..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(VerifyOtpSignupRequest(queryParameters: queryParameters));

    return BaseResponseWithObj.fromJson(res);
  }

  @override
  Future<BaseResponseWithObj> verifyOtpForgotPassword(
      VerifyOtpDataRequest dataRequest) async {
    Map<String, dynamic> queryParameters = {
      "tel": dataRequest.phoneNumber,
      "verifyCodes": dataRequest.verifyCode,
    }..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService().request(
        VerifyOtpForgotPasswordRequest(queryParameters: queryParameters));

    return BaseResponseWithObj.fromJson(res);
  }
}
