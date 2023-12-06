import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

abstract class VerifyOtpDatasources {
  Future<BaseRequestResponse> verifyOtpSignup(VerifyOtpDataRequest dataRequest);
  Future<BaseRequestResponse> verifyOtpForgotPassword(
      VerifyOtpDataRequest dataRequest);
}
