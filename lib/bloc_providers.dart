import 'package:espot_power/features/deposit_money/dashboard/presentation/bloc/dashboard_deposit_money_cubit.dart';
import 'package:espot_power/features/deposit_money/electronic_wallet/dashboard/presentation/bloc/electric_wallet_cubit.dart';

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
];
