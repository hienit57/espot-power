import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

class LoginDatasourcesImpl extends LoginDatasources {
  @override
  Future<BaseRequestResponse> login(LoginModelRequest dataRequest) async {
    Map<String, dynamic> queryParameters = {
      "phone": dataRequest.phoneNumber,
      "pwd": dataRequest.password,
    }..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(LoginRequest(queryParameters: queryParameters));

    return BaseRequestResponse.fromJson(res);
  }
}
