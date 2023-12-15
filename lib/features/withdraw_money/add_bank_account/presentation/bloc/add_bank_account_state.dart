part of 'add_bank_account_cubit.dart';

class AddBankAccountState extends Equatable {
  final RequestStatus? onGetBankList;
  final RequestStatus? onVerifyAddBankAccount;

  final List<BankInformationResponse>? bankListResponse;

  final BankInformationResponse? bankSelected;

  final UserProfileResponse? userProfileResponse;

  final ErrorVerifyAddBankAccount? msgVerifyAddBank;

  const AddBankAccountState({
    this.onGetBankList,
    this.onVerifyAddBankAccount,
    this.bankListResponse,
    this.bankSelected,
    this.userProfileResponse,
    this.msgVerifyAddBank,
  });

  AddBankAccountState copyWith({
    RequestStatus? onGetBankList,
    RequestStatus? onVerifyAddBankAccount,
    List<BankInformationResponse>? bankListResponse,
    BankInformationResponse? bankSelected,
    UserProfileResponse? userProfileResponse,
    ErrorVerifyAddBankAccount? msgVerifyAddBank,
  }) {
    return AddBankAccountState(
      onGetBankList: onGetBankList ?? this.onGetBankList,
      onVerifyAddBankAccount:
          onVerifyAddBankAccount ?? this.onVerifyAddBankAccount,
      bankListResponse: bankListResponse ?? this.bankListResponse,
      bankSelected: bankSelected ?? this.bankSelected,
      userProfileResponse: userProfileResponse ?? this.userProfileResponse,
      msgVerifyAddBank: msgVerifyAddBank ?? this.msgVerifyAddBank,
    );
  }

  @override
  List<Object?> get props => [
        onGetBankList,
        onVerifyAddBankAccount,
        bankListResponse,
        bankSelected,
        userProfileResponse,
        msgVerifyAddBank,
      ];
}
