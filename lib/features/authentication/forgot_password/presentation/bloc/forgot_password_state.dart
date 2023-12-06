part of 'forgot_password_cubit.dart';

class ForgotPasswordState extends Equatable {
  final RequestStatus? onForgotPassword;
  final String? msgForgotPassword;

  const ForgotPasswordState({
    this.onForgotPassword,
    this.msgForgotPassword,
  });

  ForgotPasswordState copyWith({
    RequestStatus? onForgotPassword,
    String? msgForgotPassword,
  }) {
    return ForgotPasswordState(
      onForgotPassword: onForgotPassword ?? this.onForgotPassword,
      msgForgotPassword: msgForgotPassword ?? this.msgForgotPassword,
    );
  }

  @override
  List<Object?> get props => [
        onForgotPassword,
        msgForgotPassword,
      ];
}
