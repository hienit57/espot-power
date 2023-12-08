part of 'change_password_cubit.dart';

class ChangePasswordState extends Equatable {
  final RequestStatus? onChangePassword;
  final String? msgChangePwd;

  final bool? isShowOldPwd;
  final bool? isShowNewPwd;
  final bool? isShowConfirmPwd;

  const ChangePasswordState({
    this.onChangePassword,
    this.msgChangePwd,
    this.isShowOldPwd,
    this.isShowNewPwd,
    this.isShowConfirmPwd,
  });

  ChangePasswordState copyWith({
    RequestStatus? onChangePassword,
    String? msgChangePwd,
    bool? isShowOldPwd,
    bool? isShowNewPwd,
    bool? isShowConfirmPwd,
  }) {
    return ChangePasswordState(
      onChangePassword: onChangePassword ?? this.onChangePassword,
      msgChangePwd: msgChangePwd ?? this.msgChangePwd,
      isShowOldPwd: isShowOldPwd ?? this.isShowOldPwd,
      isShowNewPwd: isShowNewPwd ?? this.isShowNewPwd,
      isShowConfirmPwd: isShowConfirmPwd ?? this.isShowConfirmPwd,
    );
  }

  @override
  List<Object?> get props => [
        onChangePassword,
        msgChangePwd,
        isShowOldPwd,
        isShowNewPwd,
        isShowConfirmPwd,
      ];
}
