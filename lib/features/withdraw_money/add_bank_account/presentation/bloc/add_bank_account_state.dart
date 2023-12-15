part of 'add_bank_account_cubit.dart';

class AddBankAccountState extends Equatable {
  final RequestStatus? onGetView;
  const AddBankAccountState({this.onGetView});

  AddBankAccountState copyWith({
    RequestStatus? onGetView,
  }) {
    return AddBankAccountState(
      onGetView: onGetView ?? this.onGetView,
    );
  }

  @override
  List<Object?> get props => [
        onGetView,
      ];
}
