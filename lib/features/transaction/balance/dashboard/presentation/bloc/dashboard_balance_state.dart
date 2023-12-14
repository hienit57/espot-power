part of 'dashboard_balance_cubit.dart';

class DashboardBalanceState extends Equatable {
  final RequestStatus? onGetBalance;

  final UserProfileResponse? userProfileResponse;

  const DashboardBalanceState({
    this.onGetBalance,
    this.userProfileResponse,
  });

  DashboardBalanceState copyWith({
    RequestStatus? onGetBalance,
    UserProfileResponse? userProfileResponse,
  }) {
    return DashboardBalanceState(
      onGetBalance: onGetBalance ?? this.onGetBalance,
      userProfileResponse: userProfileResponse ?? this.userProfileResponse,
    );
  }

  @override
  List<Object?> get props => [
        onGetBalance,
        userProfileResponse,
      ];
}
