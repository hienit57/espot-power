import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

abstract class ContactForCooperationDatasources {
  Future<BaseResponseWithObj> contactForCooperation(
      ContactForCooperationModelRequest dataRequest);
}
