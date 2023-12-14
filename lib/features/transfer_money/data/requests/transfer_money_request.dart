import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class TransferMoneyRequest extends RequestModel {
  TransferMoneyRequest({String? body, Map<String, dynamic>? queryParameters})
      : super(
          route: '/Java/m/user/oauth/balance/transfer/create',
          requestType: RequestType.http,
          requestMethod: RequestMethod.get,
          params: body,
          queryParameters: queryParameters,
        );
}
