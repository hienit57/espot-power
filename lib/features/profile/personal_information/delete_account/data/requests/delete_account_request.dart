import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class DeleteAccountRequest extends RequestModel {
  DeleteAccountRequest({String? body, Map<String, dynamic>? queryParameters})
      : super(
          route: '/Java/m/user/oauth/delete',
          requestType: RequestType.http,
          requestMethod: RequestMethod.delete,
          params: body,
          queryParameters: queryParameters,
        );
}
