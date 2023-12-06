import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class VerifyUserExistsRequest extends RequestModel {
  VerifyUserExistsRequest({String? body, Map<String, dynamic>? queryParameters})
      : super(
          route: '/Java/m/user/sms/register/get_otp',
          requestType: RequestType.http,
          requestMethod: RequestMethod.post,
          params: body,
          queryParameters: queryParameters,
        );
}
