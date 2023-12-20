import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class GetListLocationMapRequest extends RequestModel {
  GetListLocationMapRequest(
      {String? body, Map<String, dynamic>? queryParameters})
      : super(
          route: '/Java/m/user/store/nearby',
          requestType: RequestType.http,
          requestMethod: RequestMethod.post,
          params: body,
          queryParameters: queryParameters,
        );
}
