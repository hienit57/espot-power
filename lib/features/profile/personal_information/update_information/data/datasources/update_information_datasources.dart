import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

abstract class UpdateInformationDatasources {
  Future<BaseResponseWithObj> updateUserProfile(
      UpdateInformationUserModelRequest dataRequest);
}
