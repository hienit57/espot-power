part of 'delete_account_cubit.dart';

class DeleteAccountState extends Equatable {
  final RequestStatus? onDeleteAccount;
  final int? codeResponse;

  final int? indexCountdown;

  const DeleteAccountState({
    this.onDeleteAccount,
    this.indexCountdown,
    this.codeResponse,
  });

  DeleteAccountState copyWith({
    RequestStatus? onDeleteAccount,
    int? codeResponse,
    int? indexCountdown,
  }) {
    return DeleteAccountState(
      onDeleteAccount: onDeleteAccount ?? this.onDeleteAccount,
      codeResponse: codeResponse ?? this.codeResponse,
      indexCountdown: indexCountdown ?? this.indexCountdown,
    );
  }

  @override
  List<Object?> get props => [
        onDeleteAccount,
        codeResponse,
        indexCountdown,
      ];
}
