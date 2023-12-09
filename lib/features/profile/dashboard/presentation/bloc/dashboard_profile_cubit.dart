import 'package:espot_power/core/routes/app_pages.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/utils/index.dart';

part 'dashboard_profile_state.dart';

class DashboardProfileCubit extends Cubit<DashboardProfileState>
    with LoadingMixin, ToastMixin {
  DashboardProfileCubit() : super(const DashboardProfileState());

  final _datasource = GetIt.instance<DashboardProfileDatasourcesImpl>();

  Future<void> getUserProfile() async {
    emit(state.copyWith(onGetUserProfile: RequestStatus.loading));

    try {
      await _datasource.getUserProfile().then((response) async {
        final userProfileResponse = UserProfileResponse.fromJson(response.obj);
        emit(
          state.copyWith(
            onGetUserProfile: RequestStatus.success,
            userProfileResponse: userProfileResponse,
          ),
        );
      });
    } catch (e) {
      emit(state.copyWith(onGetUserProfile: RequestStatus.failure));
    }
  }

  Future<void> logout() async {
    await SharedPrefsHelper.clearData().then((value) {
      NavigatorExt.pushAndRemoveUntil(AppContext.navigatorKey.currentContext!,
          const VerifyUserPage(), AppRoutes.home);
    });
  }
}
