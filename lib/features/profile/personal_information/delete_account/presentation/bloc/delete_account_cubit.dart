import 'package:espot_power/features/index.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState>
    with LoadingMixin, ToastMixin {
  DeleteAccountCubit() : super(const DeleteAccountState());

  void countdownTimer() async {
    int seconds = 10;

    while (seconds > 0) {
      await Future.delayed(Duration(seconds: 1));
      seconds--;
      emit(state.copyWith(indexCountdown: seconds));
    }
  }

  void initData() {
    emit(state.copyWith(indexCountdown: 10));
  }

  final _datasource = GetIt.instance<DeleteAccountDatasourcesImpl>();

  Future<void> deleteAccount() async {
    emit(state.copyWith(
        onDeleteAccount: RequestStatus.loading, codeResponse: null));

    try {
      await _datasource.deleteAccount().then((response) async {
        emit(
          state.copyWith(
            codeResponse: response.code,
            onDeleteAccount: RequestStatus.success,
          ),
        );
      });
    } catch (e) {
      emit(state.copyWith(onDeleteAccount: RequestStatus.failure));
    }
  }
}
