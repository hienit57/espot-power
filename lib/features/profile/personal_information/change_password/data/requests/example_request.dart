import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class ChangePasswordRequest extends RequestModel {
  ChangePasswordRequest({String? body, Map<String, dynamic>? queryParameters})
      : super(
          route: '/Java/user/oauth/pwd/update',
          requestType: RequestType.http,
          requestMethod: RequestMethod.post,
          params: body,
          queryParameters: queryParameters,
        );
}
