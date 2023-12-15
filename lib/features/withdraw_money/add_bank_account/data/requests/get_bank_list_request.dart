import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class GetBankListRequest extends RequestModel {
  GetBankListRequest({String? body, Map<String, dynamic>? queryParameters})
      : super(
          route: '/Java/m/user/bank_list',
          requestType: RequestType.http,
          requestMethod: RequestMethod.get,
          params: body,
          queryParameters: queryParameters,
        );
}
