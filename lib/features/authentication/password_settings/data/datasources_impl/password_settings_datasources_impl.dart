import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

class PasswordSettingsDatasourcesImpl extends PasswordSettingsDatasources {
  @override
  Future<BaseRequestResponse> createPassword(
      PasswordSettingsModelRequest dataRequest) async {
    Map<String, dynamic> queryParameters = {
      "account": dataRequest.phoneNumber,
      "name": dataRequest.name,
      "password": dataRequest.password,
      "referral_phone_num": dataRequest.referralNumber,
    }..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(CreatePasswordRequest(queryParameters: queryParameters));

    return BaseRequestResponse.fromJson(res);
  }

  @override
  Future<BaseRequestResponse> updateNewPassword(
      PasswordSettingsModelRequest dataRequest) async {
    Map<String, dynamic> queryParameters = {
      "phone": dataRequest.phoneNumber,
      "pwd": dataRequest.password,
    }..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(UpdateNewPasswordRequest(queryParameters: queryParameters));

    return BaseRequestResponse.fromJson(res);
  }
}
