import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class ApplyVoucherRequest extends RequestModel {
  ApplyVoucherRequest({String? body, Map<String, dynamic>? queryParameters})
      : super(
          route: '/Java/m/user/coupon',
          requestType: RequestType.http,
          requestMethod: RequestMethod.post,
          params: body,
          queryParameters: queryParameters,
        );
}
