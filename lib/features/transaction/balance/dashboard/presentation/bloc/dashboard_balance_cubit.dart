import 'package:espot_power/features/index.dart';

part 'dashboard_balance_state.dart';

class DashboardBalanceCubit extends Cubit<DashboardBalanceState>
    with LoadingMixin, ToastMixin {
  DashboardBalanceCubit() : super(const DashboardBalanceState());

  final _datasource = GetIt.instance<DashboardBalanceDatasourcesImpl>();

  Future<void> getBalance() async {
    emit(state.copyWith(onGetBalance: RequestStatus.loading));

    try {
      await _datasource.getBalance().then((response) async {
        final dataResponse = UserProfileResponse.fromJson(response.obj);

        emit(
          state.copyWith(
            onGetBalance: RequestStatus.success,
            userProfileResponse: dataResponse,
          ),
        );
      });
    } catch (e) {
      emit(state.copyWith(onGetBalance: RequestStatus.failure));
    }
  }
}
