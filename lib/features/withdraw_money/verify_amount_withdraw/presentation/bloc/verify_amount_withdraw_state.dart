part of 'verify_amount_withdraw_cubit.dart';

class VerifyAmountWithdrawState extends Equatable {
  final RequestStatus? onGetView;
  const VerifyAmountWithdrawState({this.onGetView});

  VerifyAmountWithdrawState copyWith({
    RequestStatus? onGetView,
  }) {
    return VerifyAmountWithdrawState(
      onGetView: onGetView ?? this.onGetView,
    );
  }

  @override
  List<Object?> get props => [
        onGetView,
      ];
}
