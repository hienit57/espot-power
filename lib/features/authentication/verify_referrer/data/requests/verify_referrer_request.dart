import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class VerifyReferrerRequest extends RequestModel {
  VerifyReferrerRequest({String? body, Map<String, dynamic>? queryParameters})
      : super(
          route: '/Java/user/referral_phone',
          requestType: RequestType.http,
          requestMethod: RequestMethod.post,
          params: body,
          queryParameters: queryParameters,
        );
}
