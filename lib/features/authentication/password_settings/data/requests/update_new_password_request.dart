import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class UpdateNewPasswordRequest extends RequestModel {
  UpdateNewPasswordRequest(
      {String? body, Map<String, dynamic>? queryParameters})
      : super(
          route: '/Java/user/forget/reset/pwd/sms',
          requestType: RequestType.http,
          requestMethod: RequestMethod.post,
          params: body,
          queryParameters: queryParameters,
        );
}
