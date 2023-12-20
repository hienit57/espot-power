import 'features/index.dart';

final providers = [
  BlocProvider<OnboardingCubit>(
    create: (context) => OnboardingCubit(),
  ),
  BlocProvider<VerifyUserExistsCubit>(
    create: (context) => VerifyUserExistsCubit(),
  ),
  BlocProvider<VerifyOtpCubit>(
    create: (context) => VerifyOtpCubit(),
  ),
  BlocProvider<VerifyReferrerCubit>(
    create: (context) => VerifyReferrerCubit(),
  ),
  BlocProvider<PasswordSettingsCubit>(
    create: (context) => PasswordSettingsCubit(),
  ),
  BlocProvider<LoginCubit>(
    create: (context) => LoginCubit(),
  ),
  BlocProvider<ForgotPasswordCubit>(
    create: (context) => ForgotPasswordCubit(),
  ),
  BlocProvider<HomeCubit>(
    create: (context) => HomeCubit(),
  ),
  BlocProvider<DashboardProfileCubit>(
    create: (context) => DashboardProfileCubit(),
  ),
  BlocProvider<ChangePasswordCubit>(
    create: (context) => ChangePasswordCubit(),
  ),
  BlocProvider<UpdateInformationUserCubit>(
    create: (context) => UpdateInformationUserCubit(),
  ),
  BlocProvider<DeleteAccountCubit>(
    create: (context) => DeleteAccountCubit(),
  ),
  BlocProvider<UserManualCubit>(
    create: (context) => UserManualCubit(),
  ),
  BlocProvider<ContactForCooperationCubit>(
    create: (context) => ContactForCooperationCubit(),
  ),
  BlocProvider<FeedbackCubit>(
    create: (context) => FeedbackCubit(),
  ),
  BlocProvider<NotificationCubit>(
    create: (context) => NotificationCubit(),
  ),
  BlocProvider<DashboardTransactionCubit>(
    create: (context) => DashboardTransactionCubit(),
  ),
  BlocProvider<DashboardOrderCubit>(
    create: (context) => DashboardOrderCubit(),
  ),
  BlocProvider<DashboardBalanceCubit>(
    create: (context) => DashboardBalanceCubit(),
  ),
  BlocProvider<HistoryTransactionCubit>(
    create: (context) => HistoryTransactionCubit(),
  ),
  BlocProvider<DashboardDepositMoneyCubit>(
    create: (context) => DashboardDepositMoneyCubit(),
  ),
  BlocProvider<ElectricWalletCubit>(
    create: (context) => ElectricWalletCubit(),
  ),
  BlocProvider<TransferMoneyCubit>(
    create: (context) => TransferMoneyCubit(),
  ),
  BlocProvider<VoucherCubit>(
    create: (context) => VoucherCubit(),
  ),
  BlocProvider<AddBankAccountCubit>(
    create: (context) => AddBankAccountCubit(),
  ),
  BlocProvider<SelectBankAccountCubit>(
    create: (context) => SelectBankAccountCubit(),
  ),
  BlocProvider<VerifyAmountWithdrawCubit>(
    create: (context) => VerifyAmountWithdrawCubit(),
  ),
  BlocProvider<ScanCubit>(
    create: (context) => ScanCubit(),
  ),
  BlocProvider<ConfirmForRentCubit>(
    create: (context) => ConfirmForRentCubit(),
  ),
  BlocProvider<MapCubit>(
    create: (context) => MapCubit(),
  ),
];
