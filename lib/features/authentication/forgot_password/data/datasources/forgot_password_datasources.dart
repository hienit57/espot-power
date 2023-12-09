import 'package:espot_power/core/index.dart';

abstract class ForgotPasswordDatasources {
  Future<BaseResponseWithObj> forgotPassword(String? phoneNumber);
}
