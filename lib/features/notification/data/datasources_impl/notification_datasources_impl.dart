import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/models/index.dart';

class NotificationDatasourcesImpl extends NotificationDatasources {
  @override
  Future<BaseResponseWithPagination> getListNotification(
      NotificationModelRequest dataRequest) async {
    Map<String, dynamic> queryParameters = {
      "notificationCategory": dataRequest.typeNotification,
      "pageNo": dataRequest.skip ?? 1,
      "pageSize": dataRequest.take ?? 20,
    }..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService().request(
        GetListHistoryTransactionRequest(queryParameters: queryParameters));

    return BaseResponseWithPagination<NotificationResponse>.fromJson(res,
        (json) => NotificationResponse.fromJson(json as Map<String, dynamic>));
  }
}
