part of 'transfer_money_cubit.dart';

class TransferMoneyState extends Equatable {
  final RequestStatus? onGetInformationReceiver;
  final String? msgGetInformationReceicer;

  final RequestStatus? onTransferMoney;

  final UserProfileResponse? userProfile;

  final UserProfileResponse? userProfileReceiver;

  const TransferMoneyState({
    this.onGetInformationReceiver,
    this.msgGetInformationReceicer,
    this.onTransferMoney,
    this.userProfile,
    this.userProfileReceiver,
  });

  TransferMoneyState copyWith({
    RequestStatus? onGetInformationReceiver,
    String? msgGetInformationReceicer,
    RequestStatus? onTransferMoney,
    UserProfileResponse? userProfile,
    UserProfileResponse? userProfileReceiver,
  }) {
    return TransferMoneyState(
      onGetInformationReceiver:
          onGetInformationReceiver ?? this.onGetInformationReceiver,
      msgGetInformationReceicer:
          msgGetInformationReceicer ?? this.msgGetInformationReceicer,
      onTransferMoney: onTransferMoney ?? this.onTransferMoney,
      userProfile: userProfile ?? this.userProfile,
      userProfileReceiver: userProfileReceiver ?? this.userProfileReceiver,
    );
  }

  @override
  List<Object?> get props => [
        onGetInformationReceiver,
        msgGetInformationReceicer,
        onTransferMoney,
        userProfile,
        userProfileReceiver,
      ];
}
