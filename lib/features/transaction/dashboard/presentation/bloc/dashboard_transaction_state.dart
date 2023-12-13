part of 'dashboard_transaction_cubit.dart';

class DashboardTransactionState extends Equatable {
  final int? indexTabbar;
  const DashboardTransactionState({this.indexTabbar});

  DashboardTransactionState copyWith({
    int? indexTabbar,
  }) {
    return DashboardTransactionState(
      indexTabbar: indexTabbar ?? this.indexTabbar,
    );
  }

  @override
  List<Object?> get props => [
        indexTabbar,
      ];
}
