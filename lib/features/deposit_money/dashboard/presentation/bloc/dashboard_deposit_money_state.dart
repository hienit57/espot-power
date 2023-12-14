part of 'dashboard_deposit_money_cubit.dart';

class DashboardDepositMoneyState extends Equatable {
  final PriceDepositMoney? priceDepositMoney;
  final TypePayments? typePayment;

  final String? msgSelectDepositMoney;

  const DashboardDepositMoneyState({
    this.priceDepositMoney,
    this.typePayment,
    this.msgSelectDepositMoney,
  });

  DashboardDepositMoneyState copyWith({
    PriceDepositMoney? priceDepositMoney,
    TypePayments? typePayment,
    String? msgSelectDepositMoney,
  }) {
    return DashboardDepositMoneyState(
      priceDepositMoney: priceDepositMoney ?? this.priceDepositMoney,
      typePayment: typePayment ?? this.typePayment,
      msgSelectDepositMoney:
          msgSelectDepositMoney ?? this.msgSelectDepositMoney,
    );
  }

  @override
  List<Object?> get props => [
        priceDepositMoney,
        typePayment,
        msgSelectDepositMoney,
      ];
}
