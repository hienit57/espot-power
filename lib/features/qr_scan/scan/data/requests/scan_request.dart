import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class ScanRequest extends RequestModel {
  ScanRequest({String? body, Map<String, dynamic>? queryParameters})
      : super(
          route: '/Java/m/user/batteries/heartbeat',
          requestType: RequestType.http,
          requestMethod: RequestMethod.get,
          params: body,
          queryParameters: queryParameters,
        );
}
