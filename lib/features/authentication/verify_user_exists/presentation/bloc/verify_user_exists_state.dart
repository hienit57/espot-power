part of 'verify_user_exists_cubit.dart';

class VerifyUserExistsState extends Equatable {
  final RequestStatus? onVerifyUserExists;

  final String? msgVerifyUserExists;

  const VerifyUserExistsState({
    this.onVerifyUserExists,
    this.msgVerifyUserExists,
  });

  VerifyUserExistsState copyWith({
    RequestStatus? onVerifyUserExists,
    String? msgVerifyUserExists,
  }) {
    return VerifyUserExistsState(
      onVerifyUserExists: onVerifyUserExists ?? this.onVerifyUserExists,
      msgVerifyUserExists: msgVerifyUserExists ?? this.msgVerifyUserExists,
    );
  }

  @override
  List<Object?> get props => [
        onVerifyUserExists,
        msgVerifyUserExists,
      ];
}
