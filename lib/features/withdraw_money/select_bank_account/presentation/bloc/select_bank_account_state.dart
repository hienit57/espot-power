part of 'select_bank_account_cubit.dart';

class SelectBankAccountState extends Equatable {
  final RequestStatus? onGetListBank;

  final List<BankInformationResponse>? listYourBank;

  final BankInformationResponse? yourBankSelected;
  final String? msgSelectBank;

  const SelectBankAccountState({
    this.onGetListBank,
    this.listYourBank,
    this.yourBankSelected,
    this.msgSelectBank,
  });

  SelectBankAccountState copyWith({
    RequestStatus? onGetListBank,
    List<BankInformationResponse>? listYourBank,
    BankInformationResponse? yourBankSelected,
    String? msgSelectBank,
  }) {
    return SelectBankAccountState(
      onGetListBank: onGetListBank ?? this.onGetListBank,
      listYourBank: listYourBank ?? this.listYourBank,
      yourBankSelected: yourBankSelected ?? this.yourBankSelected,
      msgSelectBank: msgSelectBank ?? this.msgSelectBank,
    );
  }

  @override
  List<Object?> get props => [
        onGetListBank,
        listYourBank,
        yourBankSelected,
        msgSelectBank,
      ];
}
