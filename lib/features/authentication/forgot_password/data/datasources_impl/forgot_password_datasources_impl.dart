import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

class ForgotPasswordDatasourcesImpl extends ForgotPasswordDatasources {
  @override
  Future<BaseRequestResponse> forgotPassword(String? phoneNumber) async {
    Map<String, dynamic> queryParameters = {
      "phoneNumber": phoneNumber,
    }..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(ForgotPasswordRequest(queryParameters: queryParameters));

    return BaseRequestResponse.fromJson(res);
  }
}
