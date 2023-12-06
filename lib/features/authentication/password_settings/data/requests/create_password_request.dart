import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class CreatePasswordRequest extends RequestModel {
  CreatePasswordRequest({String? body, Map<String, dynamic>? queryParameters})
      : super(
          route: '/Java/user/register',
          requestType: RequestType.http,
          requestMethod: RequestMethod.post,
          params: body,
          queryParameters: queryParameters,
        );
}
