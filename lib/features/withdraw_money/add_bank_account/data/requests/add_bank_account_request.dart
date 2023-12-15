import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class AddBankAccountRequest extends RequestModel {
  AddBankAccountRequest({String? body, Map<String, dynamic>? queryParameters})
      : super(
          route: '/Java/m/user/get_bank_account_info/lite',
          requestType: RequestType.http,
          requestMethod: RequestMethod.get,
          params: body,
          queryParameters: queryParameters,
        );
}
