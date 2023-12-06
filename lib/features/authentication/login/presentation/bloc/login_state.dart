part of 'login_cubit.dart';

class LoginState extends Equatable {
  final RequestStatus? onLogin;

  final String? msgLogin;
  final bool? isShowPassword;

  const LoginState({
    this.onLogin,
    this.msgLogin,
    this.isShowPassword,
  });

  LoginState copyWith({
    RequestStatus? onLogin,
    String? msgLogin,
    bool? isShowPassword,
  }) {
    return LoginState(
      onLogin: onLogin ?? this.onLogin,
      msgLogin: msgLogin ?? this.msgLogin,
      isShowPassword: isShowPassword ?? this.isShowPassword,
    );
  }

  @override
  List<Object?> get props => [
        onLogin,
        msgLogin,
        isShowPassword,
      ];
}
