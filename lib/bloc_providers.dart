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
];
