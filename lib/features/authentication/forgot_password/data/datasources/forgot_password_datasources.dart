import 'package:espot_power/core/index.dart';

abstract class ForgotPasswordDatasources {
  Future<BaseRequestResponse> forgotPassword(String? phoneNumber);
}
