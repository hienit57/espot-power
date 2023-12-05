import 'package:bas_clean_architecture/features/login/presentation/bloc/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/global/index.dart';

final providers = [
  BlocProvider<GlobalCubit>(
    create: (context) => GlobalCubit(),
  ),
  BlocProvider<LoginCubit>(
    create: (context) => LoginCubit(),
  ),
];
