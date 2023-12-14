import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:flutter/widgets.dart';

part 'transfer_money_state.dart';

class TransferMoneyCubit extends Cubit<TransferMoneyState>
    with LoadingMixin, ToastMixin {
  TransferMoneyCubit() : super(const TransferMoneyState());

  final priceController = TextEditingController();
  final phoneController = TextEditingController();

  void initData() {
    phoneController.text = '';
    priceController.text = '0 VND';
  }

  final _datasource = GetIt.instance<TransferMoneyDatasourcesImpl>();

  void resetState() {
    emit(state.copyWith(
      onGetInformationReceiver: RequestStatus.initial,
      msgGetInformationReceicer: '',
    ));
  }

  Future<void> getInformationReceiver() async {
    emit(state.copyWith(onGetInformationReceiver: RequestStatus.loading));

    /// Hàm dưới là xoá 3 kí tự cuối 'VND' và thay dấu . là khoang trong
    final priceTransfer = int.parse(
        (priceController.text.substring(0, priceController.text.length - 3))
            .replaceAll('.', ''));
    if (priceController.text != '0 VND' &&
        priceController.text.length > 3 &&
        state.userProfile?.money < priceTransfer) {
      emit(
        state.copyWith(
          msgGetInformationReceicer: LocaleKeys.amount_transfer_exceeds.tr(),
          onGetInformationReceiver: RequestStatus.failure,
        ),
      );
    } else if (phoneController.text.isEmpty ||
        priceController.text == '0 VND') {
      emit(
        state.copyWith(
          msgGetInformationReceicer:
              LocaleKeys.please_enter_all_information.tr(),
          onGetInformationReceiver: RequestStatus.failure,
        ),
      );
    } else {
      try {
        await _datasource
            .getInformationReceiver(phoneController.text)
            .then((response) async {
          if (response.ok == false) {
            emit(
              state.copyWith(
                msgGetInformationReceicer: response.msg,
                onGetInformationReceiver: RequestStatus.failure,
              ),
            );
          } else {
            final dataResponse = UserProfileResponse.fromJson(response.obj[0]);
            emit(
              state.copyWith(
                userProfileReceiver: dataResponse,
                msgGetInformationReceicer: '',
                onGetInformationReceiver: RequestStatus.success,
              ),
            );
          }
        });
      } catch (e) {
        emit(state.copyWith(onGetInformationReceiver: RequestStatus.failure));
      }
    }
  }

  Future<void> transferMoney() async {
    emit(state.copyWith(onTransferMoney: RequestStatus.loading));

    try {
      /// Hàm dưới là xoá 3 kí tự cuối 'VND' và thay dấu . là khoang trong
      final priceTransfer = int.parse(
          (priceController.text.substring(0, priceController.text.length - 3))
              .replaceAll('.', ''));
      final dataRequest = TransferMoneyModelRequest(
        amount: priceTransfer,
        phoneNumber: phoneController.text,
      );
      await _datasource.transferMoney(dataRequest).then((response) async {
        if (response.ok == false) {
          emit(
            state.copyWith(
              onTransferMoney: RequestStatus.failure,
            ),
          );
        } else {
          emit(
            state.copyWith(
              onTransferMoney: RequestStatus.success,
            ),
          );
        }
      });
    } catch (e) {
      emit(state.copyWith(onTransferMoney: RequestStatus.failure));
    }
  }

  void emitUserProfile(UserProfileResponse? value) {
    emit(state.copyWith(userProfile: value));
  }
}
