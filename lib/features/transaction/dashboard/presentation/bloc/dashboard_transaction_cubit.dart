import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';

part 'dashboard_transaction_state.dart';

class DashboardTransactionCubit extends Cubit<DashboardTransactionState>
    with LoadingMixin, ToastMixin {
  DashboardTransactionCubit() : super(const DashboardTransactionState());

//  final _datasource = GetIt.instance<VerifyUserDatasourcesImpl>();

  // Future<void> verifyUserExist() async {
  //   emit(state.copyWith(onVerifyUserExists: RequestStatus.loading));

  //   try {

  //       final dataRequest = VerifyUserExistModelRequest(
  //           phoneNumber: phoneController?.text ?? '');
  //       await _datasource.verifyUserExist(dataRequest).then((response) async {
  //         if (response.ok == false) {
  //           emit(
  //             state.copyWith(
  //               msgVerifyUserExists: response.msg,
  //               onVerifyUserExists: RequestStatus.failure,
  //             ),
  //           );
  //         } else {
  //           emit(
  //             state.copyWith(
  //               msgVerifyUserExists: response.msg,
  //               onVerifyUserExists: RequestStatus.success,
  //             ),
  //           );
  //         }
  //       });

  //   } catch (e) {
  //     emit(state.copyWith(onVerifyUserExists: RequestStatus.failure));
  //   }
  // }

  void emitSelectTab(int value) {
    emit(state.copyWith(indexTabbar: value));
  }
}
