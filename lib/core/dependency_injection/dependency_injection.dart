import 'package:espot_power/features/index.dart';
import 'package:get_it/get_it.dart';

Future<void> setupDi() async {
  final getIt = GetIt.I;

  getIt.registerFactory<LoginDataSource>(() => LoginDataSource());

  getIt.registerFactory<VerifyUserDatasourcesImpl>(
      () => VerifyUserDatasourcesImpl());

  return;
}
