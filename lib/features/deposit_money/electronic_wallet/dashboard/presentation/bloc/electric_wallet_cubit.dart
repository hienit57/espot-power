import 'package:espot_power/features/deposit_money/electronic_wallet/dashboard/data/enum/electronic_wallet.dart';
import 'package:espot_power/features/index.dart';

part 'electric_wallet_state.dart';

class ElectricWalletCubit extends Cubit<ElectricWalletState>
    with LoadingMixin, ToastMixin {
  ElectricWalletCubit() : super(const ElectricWalletState());

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

  void emitElectricWallet(ElectronicWallet value) {
    emit(state.copyWith(electronicWalletSelected: value));
  }
}
