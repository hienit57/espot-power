import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class GetUserManualRequest extends RequestModel {
  GetUserManualRequest({String? body, Map<String, dynamic>? queryParameters})
      : super(
          route: '/Java/m/user/oauth/guide/all',
          requestType: RequestType.http,
          requestMethod: RequestMethod.get,
          params: body,
          queryParameters: queryParameters,
        );
}
