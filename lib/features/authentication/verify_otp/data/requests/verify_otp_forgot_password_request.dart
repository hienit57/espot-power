import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class VerifyOtpForgotPasswordRequest extends RequestModel {
  VerifyOtpForgotPasswordRequest(
      {String? body, Map<String, dynamic>? queryParameters})
      : super(
          route: '/Java/user/forget/reset/check_otp',
          requestType: RequestType.http,
          requestMethod: RequestMethod.post,
          params: body,
          queryParameters: queryParameters,
        );
}
