import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

abstract class PasswordSettingsDatasources {
  Future<BaseResponseWithObj> createPassword(
      PasswordSettingsModelRequest dataRequest);
  Future<BaseResponseWithObj> updateNewPassword(
      PasswordSettingsModelRequest dataRequest);
}
