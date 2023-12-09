import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

abstract class VerifyOtpDatasources {
  Future<BaseResponseWithObj> verifyOtpSignup(VerifyOtpDataRequest dataRequest);
  Future<BaseResponseWithObj> verifyOtpForgotPassword(
      VerifyOtpDataRequest dataRequest);
}
