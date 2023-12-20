import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class SearchLocationRequest extends RequestModel {
  SearchLocationRequest({String? body, Map<String, dynamic>? queryParameters})
      : super(
          route: '/Java/m/user/store/search',
          requestType: RequestType.http,
          requestMethod: RequestMethod.post,
          params: body,
          queryParameters: queryParameters,
        );
}
