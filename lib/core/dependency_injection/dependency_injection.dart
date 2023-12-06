import 'package:espot_power/features/index.dart';

Future<void> setupDi() async {
  final getIt = GetIt.I;

  getIt.registerFactory<LoginDatasourcesImpl>(() => LoginDatasourcesImpl());
  getIt.registerFactory<VerifyUserDatasourcesImpl>(
      () => VerifyUserDatasourcesImpl());
  getIt.registerFactory<VerifyOtpDatasourcesImpl>(
      () => VerifyOtpDatasourcesImpl());
  getIt.registerFactory<VerifyReferrerDatasourcesImpl>(
      () => VerifyReferrerDatasourcesImpl());
  getIt.registerFactory<PasswordSettingsDatasourcesImpl>(
      () => PasswordSettingsDatasourcesImpl());
  getIt.registerFactory<ForgotPasswordDatasourcesImpl>(
      () => ForgotPasswordDatasourcesImpl());

  return;
}
