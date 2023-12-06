import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

abstract class PasswordSettingsDatasources {
  Future<BaseRequestResponse> createPassword(
      PasswordSettingsModelRequest dataRequest);
  Future<BaseRequestResponse> updateNewPassword(
      PasswordSettingsModelRequest dataRequest);
}
