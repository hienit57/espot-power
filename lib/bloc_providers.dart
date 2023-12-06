import 'features/index.dart';

final providers = [
  BlocProvider<OnboardingCubit>(
    create: (context) => OnboardingCubit(),
  ),
  BlocProvider<VerifyUserExistsCubit>(
    create: (context) => VerifyUserExistsCubit(),
  ),
  BlocProvider<LoginCubit>(
    create: (context) => LoginCubit(),
  ),
];
