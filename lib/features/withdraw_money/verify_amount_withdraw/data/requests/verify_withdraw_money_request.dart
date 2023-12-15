import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class VerifyWithdrawMoneyRequest extends RequestModel {
  VerifyWithdrawMoneyRequest(
      {String? body, Map<String, dynamic>? queryParameters})
      : super(
          route: '/Java/m/user/withdraw',
          requestType: RequestType.http,
          requestMethod: RequestMethod.post,
          params: body,
          queryParameters: queryParameters,
        );
}
