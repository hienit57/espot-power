import 'package:espot_power/core/network/http_request/request_model/request_model.dart';

class FeedbackRequest extends RequestModel {
  FeedbackRequest({String? body, Map<String, dynamic>? queryParameters})
      : super(
          route: '/Java/m/user/oauth/feedback/equipment',
          requestType: RequestType.http,
          requestMethod: RequestMethod.post,
          params: body,
          queryParameters: queryParameters,
        );
}
