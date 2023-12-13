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
  getIt.registerFactory<DashboardProfileDatasourcesImpl>(
      () => DashboardProfileDatasourcesImpl());
  getIt.registerFactory<ChangePasswordDatasourcesImpl>(
      () => ChangePasswordDatasourcesImpl());
  getIt.registerFactory<UpdateUserProfileDatasourcesImpl>(
      () => UpdateUserProfileDatasourcesImpl());
  getIt.registerFactory<DeleteAccountDatasourcesImpl>(
      () => DeleteAccountDatasourcesImpl());
  getIt.registerFactory<FeedbackDatasourcesImpl>(
      () => FeedbackDatasourcesImpl());
  getIt.registerFactory<UserManualDatasourcesImpl>(
      () => UserManualDatasourcesImpl());
  getIt.registerFactory<ContactForCooperationDatasourcesImpl>(
      () => ContactForCooperationDatasourcesImpl());
  getIt.registerFactory<NotificationDatasourcesImpl>(
      () => NotificationDatasourcesImpl());
  getIt.registerFactory<DashboardOrderDatasourcesImpl>(
      () => DashboardOrderDatasourcesImpl());
  return;
}
