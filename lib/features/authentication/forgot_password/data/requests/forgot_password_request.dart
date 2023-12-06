import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class ForgotPasswordRequest extends RequestModel {
  ForgotPasswordRequest({String? query, Map<String, dynamic>? queryParameters})
      : super(
          route: '/Java/m/user/sms/resetpwd/get_otp',
          requestType: RequestType.http,
          requestMethod: RequestMethod.post,
          params: query,
          queryParameters: queryParameters,
        );
}
