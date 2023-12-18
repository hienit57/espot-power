import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class CreateOrderRentRequest extends RequestModel {
  CreateOrderRentRequest({String? body, Map<String, dynamic>? queryParameters})
      : super(
          route: '/Java/m/user/oauth/battery/order/create',
          requestType: RequestType.http,
          requestMethod: RequestMethod.post,
          params: body,
          queryParameters: queryParameters,
        );
}
