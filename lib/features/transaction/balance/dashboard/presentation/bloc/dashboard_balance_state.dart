part of 'dashboard_balance_cubit.dart';

class DashboardBalanceState extends Equatable {
  final RequestStatus? onGetBalance;
  const DashboardBalanceState({this.onGetBalance});

  DashboardBalanceState copyWith({
    RequestStatus? onGetBalance,
  }) {
    return DashboardBalanceState(
      onGetBalance: onGetBalance ?? this.onGetBalance,
    );
  }

  @override
  List<Object?> get props => [
        onGetBalance,
      ];
}
