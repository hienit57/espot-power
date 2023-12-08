import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

class UpdateUserProfileDatasourcesImpl extends UpdateInformationDatasources {
  @override
  Future<BaseRequestResponse> updateUserProfile(
      UpdateInformationUserModelRequest dataRequest) async {
    Map<String, dynamic> queryParameters = {
      "name": dataRequest.userName,
      "email": dataRequest.email,
      "dob": dataRequest.dob,
      "gender": dataRequest.gender,
      "address": dataRequest.address,
      "tel": dataRequest.phoneNum,
    }..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(UpdateInformationRequest(queryParameters: queryParameters));

    return BaseRequestResponse.fromJson(res);
  }
}
