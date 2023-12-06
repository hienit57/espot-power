import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class VerifyOtpSignupRequest extends RequestModel {
  VerifyOtpSignupRequest({String? body, Map<String, dynamic>? queryParameters})
      : super(
          route: '/Java/user/check_otp',
          requestType: RequestType.http,
          requestMethod: RequestMethod.post,
          params: body,
          queryParameters: queryParameters,
        );
}
