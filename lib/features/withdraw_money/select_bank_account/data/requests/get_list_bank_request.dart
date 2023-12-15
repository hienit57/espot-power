import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class GetListBankRequest extends RequestModel {
  GetListBankRequest({String? body, Map<String, dynamic>? queryParameters})
      : super(
          route: '/',
          requestType: RequestType.http,
          requestMethod: RequestMethod.post,
          params: body,
          queryParameters: queryParameters,
        );
}
