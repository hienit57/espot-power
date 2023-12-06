part of 'password_settings_cubit.dart';

class PasswordSettingsState extends Equatable {
  final RequestStatus? onCreatePassword;
  final RequestStatus? onUpdateNewPassword;

  final String? msgCreatePassword;

  final bool? isShowYourPassword;
  final bool? isShowConfirmPassword;

  const PasswordSettingsState({
    this.onCreatePassword,
    this.onUpdateNewPassword,
    this.msgCreatePassword,
    this.isShowYourPassword,
    this.isShowConfirmPassword,
  });

  PasswordSettingsState copyWith({
    RequestStatus? onCreatePassword,
    RequestStatus? onUpdateNewPassword,
    String? msgCreatePassword,
    bool? isShowYourPassword,
    bool? isShowConfirmPassword,
  }) {
    return PasswordSettingsState(
      onCreatePassword: onCreatePassword ?? this.onCreatePassword,
      onUpdateNewPassword: onUpdateNewPassword ?? this.onUpdateNewPassword,
      msgCreatePassword: msgCreatePassword ?? this.msgCreatePassword,
      isShowYourPassword: isShowYourPassword ?? this.isShowYourPassword,
      isShowConfirmPassword:
          isShowConfirmPassword ?? this.isShowConfirmPassword,
    );
  }

  @override
  List<Object?> get props => [
        onCreatePassword,
        onUpdateNewPassword,
        msgCreatePassword,
        isShowYourPassword,
        isShowConfirmPassword,
      ];
}
