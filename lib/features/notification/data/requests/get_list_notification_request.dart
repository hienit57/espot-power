import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class GetListHistoryTransactionRequest extends RequestModel {
  GetListHistoryTransactionRequest(
      {String? body, Map<String, dynamic>? queryParameters})
      : super(
          route: '/Java/m/notification/list',
          requestType: RequestType.http,
          requestMethod: RequestMethod.get,
          params: body,
          queryParameters: queryParameters,
        );
}
