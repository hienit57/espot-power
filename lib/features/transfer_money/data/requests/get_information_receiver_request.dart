import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class GetInformationReceiverRequest extends RequestModel {
  GetInformationReceiverRequest(
      {String? body, Map<String, dynamic>? queryParameters})
      : super(
          route: '/Java/m/user/oauth/info/byphone',
          requestType: RequestType.http,
          requestMethod: RequestMethod.get,
          params: body,
          queryParameters: queryParameters,
        );
}
