import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

abstract class NotificationDatasources {
  Future<BaseResponseWithPagination> getListNotification(
      NotificationModelRequest dataRequest);
}
