import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class UpdateInformationRequest extends RequestModel {
  UpdateInformationRequest(
      {String? body, Map<String, dynamic>? queryParameters})
      : super(
          route: '/Java/m/user/oauth/modify',
          requestType: RequestType.http,
          requestMethod: RequestMethod.put,
          params: body,
          queryParameters: queryParameters,
        );
}
