import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class GetOrdersRequest extends RequestModel {
  GetOrdersRequest({String? body, Map<String, dynamic>? queryParameters})
      : super(
          route: '/Java/m/user/oauth/battery/order/page',
          requestType: RequestType.http,
          requestMethod: RequestMethod.post,
          params: body,
          queryParameters: queryParameters,
        );
}
