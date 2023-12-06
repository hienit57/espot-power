import 'package:espot_power/core/routes/app_pages.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/utils/index.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with LoadingMixin, ToastMixin {
  HomeCubit() : super(const HomeState());

  Future<void> logout() async {
    await SharedPrefsHelper.clearData().then((value) {
      NavigatorExt.pushAndRemoveUntil(AppContext.navigatorKey.currentContext!,
          const VerifyUserPage(), AppRoutes.home);
    });
  }
}
