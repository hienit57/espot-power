import 'package:espot_power/features/index.dart';
import 'package:espot_power/models/index.dart';
import 'package:flutter/material.dart';

part 'add_bank_account_state.dart';

class AddBankAccountCubit extends Cubit<AddBankAccountState>
    with LoadingMixin, ToastMixin {
  AddBankAccountCubit() : super(const AddBankAccountState());

  final _datasource = GetIt.instance<AddBankAccountDatasourcesImpl>();

  final numberAccountController = TextEditingController();
  final nameAccountController = TextEditingController();

  void initData() {
    numberAccountController.text = '';
    nameAccountController.text = '';
    emit(state.copyWith(
      bankSelected: null,
      msgVerifyAddBank: ErrorVerifyAddBankAccount.initial,
    ));
  }

  void resetState() {
    emit(state.copyWith(
        msgVerifyAddBank: ErrorVerifyAddBankAccount.initial,
        onVerifyAddBankAccount: RequestStatus.initial));
  }

  Future<void> getBankList() async {
    emit(state.copyWith(onGetBankList: RequestStatus.loading));

    try {
      await _datasource.getBankList().then((response) async {
        final dataResponse = (response.obj as List<dynamic>?)
            ?.map((item) =>
                BankInformationResponse.fromJson(item as Map<String, dynamic>))
            .toList();
        emit(
          state.copyWith(
            bankListResponse: dataResponse,
            onGetBankList: RequestStatus.failure,
          ),
        );
      });
    } catch (e) {
      emit(state.copyWith(onGetBankList: RequestStatus.failure));
    }
  }

  Future<void> verifyAddBankAccount() async {
    emit(state.copyWith(onVerifyAddBankAccount: RequestStatus.loading));

    if (state.bankSelected == null ||
        nameAccountController.text.isEmpty ||
        numberAccountController.text.isEmpty) {
      emit(state.copyWith(
          msgVerifyAddBank: ErrorVerifyAddBankAccount.errorFillAllInformation,
          onVerifyAddBankAccount: RequestStatus.failure));
    } else if (state.userProfileResponse?.name != nameAccountController.text) {
      emit(state.copyWith(
          msgVerifyAddBank: ErrorVerifyAddBankAccount.accountNotMatch,
          onVerifyAddBankAccount: RequestStatus.failure));
    } else {
      try {
        final dataRequest = AddBankAccountModelRequest(
          account: numberAccountController.text,
          bankCode: state.bankSelected?.bankCode,
        );
        await _datasource
            .verifyAddBankAccount(dataRequest)
            .then((response) async {
          if (response.ok == true) {
            emit(
              state.copyWith(
                onVerifyAddBankAccount: RequestStatus.success,
              ),
            );
          } else {
            emit(
              state.copyWith(
                msgVerifyAddBank: ErrorVerifyAddBankAccount.errorSystem,
                onVerifyAddBankAccount: RequestStatus.failure,
              ),
            );
          }
        });
      } catch (e) {
        emit(state.copyWith(onVerifyAddBankAccount: RequestStatus.failure));
      }
    }
  }

  void emitBankSelected(String? value) {
    final index = state.bankListResponse?.firstWhere(
      (element) => element.bankName == value,
    );

    emit(state.copyWith(bankSelected: index));
  }

  void emitUserProfile(UserProfileResponse? value) {
    emit(state.copyWith(userProfileResponse: value));
  }
}
