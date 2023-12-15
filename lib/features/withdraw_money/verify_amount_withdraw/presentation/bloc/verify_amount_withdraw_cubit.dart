import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/models/index.dart';
import 'package:flutter/material.dart';

part 'verify_amount_withdraw_state.dart';

class VerifyAmountWithdrawCubit extends Cubit<VerifyAmountWithdrawState>
    with LoadingMixin, ToastMixin {
  VerifyAmountWithdrawCubit() : super(const VerifyAmountWithdrawState());

  final priceController = TextEditingController();

  void initData() {
    priceController.text = '0 VND';
    emit(state.copyWith(
      onVerifyAmountWithdraw: RequestStatus.initial,
      msgInputAmountWithdraw: '',
    ));
  }

  final _datasource = GetIt.instance<VerifyAmountWithdrawDatasourcesImpl>();

  void resetState() {
    emit(state.copyWith(
      onVerifyAmountWithdraw: RequestStatus.initial,
      msgInputAmountWithdraw: '',
    ));
  }

  Future<void> verifyAmountWithdraw(
      BankInformationResponse? bankInformationResponse) async {
    emit(state.copyWith(onVerifyAmountWithdraw: RequestStatus.loading));
    final priceWithdraw = int.parse(
        (priceController.text.substring(0, priceController.text.length - 3))
            .replaceAll('.', ''));
    try {
      final dataRequest = VerifyAmountWithdrawModelRequest(
        id: bankInformationResponse?.id,
        amount: priceWithdraw,
      );
      await _datasource.verifyWithdrawMoney(dataRequest).then((response) async {
        if (response.ok == false) {
          emit(
            state.copyWith(
              onVerifyAmountWithdraw: RequestStatus.failure,
            ),
          );
        } else {
          emit(
            state.copyWith(
              onVerifyAmountWithdraw: RequestStatus.success,
            ),
          );
        }
      });
    } catch (e) {
      emit(state.copyWith(onVerifyAmountWithdraw: RequestStatus.failure));
    }
  }

  void emitUserProfile(UserProfileResponse? value) {
    emit(state.copyWith(userProfile: value));
  }

  void checkAmountWithdraw({BankInformationResponse? bankInformationResponse}) {
    final priceWithdraw = int.parse(
        (priceController.text.substring(0, priceController.text.length - 3))
            .replaceAll('.', ''));

    if (priceController.text == '0 VND') {
      emit(
        state.copyWith(
          msgInputAmountWithdraw: LocaleKeys.please_enter_all_information.tr(),
        ),
      );
    } else if (priceController.text != '0 VND' &&
        priceController.text.length > 3 &&
        state.userProfile?.money < priceWithdraw) {
      emit(
        state.copyWith(
          msgInputAmountWithdraw: LocaleKeys.amount_transfer_exceeds.tr(),
        ),
      );
    } else {
      if (priceWithdraw > 500000) {
        emit(
          state.copyWith(
            msgInputAmountWithdraw:
                '${LocaleKeys.messenge_maximum_limit.tr()} 500.000đ/lần',
          ),
        );
      } else {
        NavigatorExt.push(
          AppContext.navigatorKey.currentContext!,
          VerifyAmountWithDrawPage(
            bankInformationResponse: bankInformationResponse,
          ),
        );
      }
    }
  }
}
