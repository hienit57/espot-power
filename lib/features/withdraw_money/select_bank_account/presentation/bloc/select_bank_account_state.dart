part of 'select_bank_account_cubit.dart';

class SelectBankAccountState extends Equatable {
  final RequestStatus? onGetView;
  const SelectBankAccountState({this.onGetView});

  SelectBankAccountState copyWith({
    RequestStatus? onGetView,
  }) {
    return SelectBankAccountState(
      onGetView: onGetView ?? this.onGetView,
    );
  }

  @override
  List<Object?> get props => [
        onGetView,
      ];
}
