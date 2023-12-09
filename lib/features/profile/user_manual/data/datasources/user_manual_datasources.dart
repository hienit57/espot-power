import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

abstract class UserManualDatasources {
  Future<BaseResponseWithPagination> getUserManual(
      UserManualModelRequest dataRequest);
}
