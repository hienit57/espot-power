import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class PayBalanceRequest extends RequestModel {
  PayBalanceRequest({String? body, Map<String, dynamic>? queryParameters})
      : super(
          route: '/Java/m/user/oauth/paying/balance',
          requestType: RequestType.http,
          requestMethod: RequestMethod.post,
          params: body,
          queryParameters: queryParameters,
        );
}
