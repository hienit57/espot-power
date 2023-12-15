part of 'verify_amount_withdraw_cubit.dart';

class VerifyAmountWithdrawState extends Equatable {
  final RequestStatus? onVerifyAmountWithdraw;

  final UserProfileResponse? userProfile;

  final String? msgInputAmountWithdraw;

  const VerifyAmountWithdrawState({
    this.onVerifyAmountWithdraw,
    this.userProfile,
    this.msgInputAmountWithdraw,
  });

  VerifyAmountWithdrawState copyWith({
    RequestStatus? onVerifyAmountWithdraw,
    UserProfileResponse? userProfile,
    String? msgInputAmountWithdraw,
  }) {
    return VerifyAmountWithdrawState(
      onVerifyAmountWithdraw:
          onVerifyAmountWithdraw ?? this.onVerifyAmountWithdraw,
      userProfile: userProfile ?? this.userProfile,
      msgInputAmountWithdraw:
          msgInputAmountWithdraw ?? this.msgInputAmountWithdraw,
    );
  }

  @override
  List<Object?> get props => [
        onVerifyAmountWithdraw,
        userProfile,
        msgInputAmountWithdraw,
      ];
}
