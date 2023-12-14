import 'package:espot_power/features/deposit_money/dashboard/data/enum/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:flutter/widgets.dart';

part 'dashboard_deposit_money_state.dart';

class DashboardDepositMoneyCubit extends Cubit<DashboardDepositMoneyState>
    with LoadingMixin, ToastMixin {
  DashboardDepositMoneyCubit() : super(const DashboardDepositMoneyState());

  TextEditingController? ortherPrice = TextEditingController();

  void resetData() {
    emit(state.copyWith(
      msgSelectDepositMoney: '',
      typePayment: null,
      priceDepositMoney: null,
    ));
  }

  void resetState() {
    emit(state.copyWith(msgSelectDepositMoney: ''));
  }

  void emitPriceDepositMoney(PriceDepositMoney value) {
    ortherPrice?.text = '';
    resetState();
    emit(state.copyWith(priceDepositMoney: value));
  }

  void emitTypePayment(TypePayments value) {
    emit(state.copyWith(typePayment: value));
  }

  void checkErrorDepositMoney() {
    if (state.priceDepositMoney != null || state.priceDepositMoney != null) {
      if (state.priceDepositMoney == PriceDepositMoney.otherPrice &&
          ortherPrice?.text != null) {
        emit(state.copyWith(
            msgSelectDepositMoney: LocaleKeys.enter_even_amount.tr()));
      } else {
        emit(state.copyWith(msgSelectDepositMoney: ''));
        onPaymentMethod(state.typePayment!);
      }
    } else {
      emit(state.copyWith(
          msgSelectDepositMoney:
              LocaleKeys.please_choose_amount_and_payment_method.tr()));
    }
  }

  void onPaymentMethod(TypePayments value) {
    switch (value) {
      case TypePayments.bankTransfer:
        //NavigatorExt.push(AppContext.navigatorKey.currentContext!, screen);
        break;
      case TypePayments.electronicWallet:
        NavigatorExt.push(AppContext.navigatorKey.currentContext!,
            const DashboardElectronicWalletPage());
        break;
      case TypePayments.visaMastercard:
        //NavigatorExt.push(AppContext.navigatorKey.currentContext!, screen);
        break;
      case TypePayments.internetBanking:
        //NavigatorExt.push(AppContext.navigatorKey.currentContext!, screen);
        break;
      default:
        break;
    }
  }
}
