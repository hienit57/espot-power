import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class LoginRequest extends RequestModel {
  LoginRequest({String? query, Map<String, dynamic>? queryParameters})
      : super(
          route: '/Java/m/user/login/tel/v2',
          requestType: RequestType.http,
          requestMethod: RequestMethod.post,
          params: query,
          queryParameters: queryParameters,
        );
}
