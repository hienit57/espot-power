part of 'login_cubit.dart';

class LoginState extends Equatable {
  final RequestStatus? onLogin;
  final RequestStatus? onResetPassword;
  final DataUserLogin? loginResponse;
  final bool? isErrorWrongEmailOrPassword;
  final bool? isColorLightButtonLogin;

  const LoginState({
    this.onLogin,
    this.onResetPassword,
    this.loginResponse,
    this.isErrorWrongEmailOrPassword,
    this.isColorLightButtonLogin,
  });

  LoginState copyWith({
    RequestStatus? onLogin,
    DataUserLogin? loginResponse,
    RequestStatus? onResetPassword,
    bool? isErrorWrongEmailOrPassword,
    bool? isColorLightButtonLogin,
  }) {
    return LoginState(
      onLogin: onLogin ?? this.onLogin,
      loginResponse: loginResponse ?? this.loginResponse,
      onResetPassword: onResetPassword ?? this.onResetPassword,
      isErrorWrongEmailOrPassword:
          isErrorWrongEmailOrPassword ?? this.isErrorWrongEmailOrPassword,
      isColorLightButtonLogin:
          isColorLightButtonLogin ?? this.isColorLightButtonLogin,
    );
  }

  @override
  List<Object?> get props => [
        onLogin,
        loginResponse,
        onResetPassword,
        isErrorWrongEmailOrPassword,
        isColorLightButtonLogin,
      ];
}
