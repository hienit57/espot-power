import 'package:espot_power/features/profile/dashboard/presentation/bloc/dashboard_profile_cubit.dart';

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
];
