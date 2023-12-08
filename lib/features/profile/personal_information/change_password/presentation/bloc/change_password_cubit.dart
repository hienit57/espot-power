import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/utils/index.dart';
import 'package:flutter/material.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState>
    with LoadingMixin, ToastMixin {
  ChangePasswordCubit() : super(const ChangePasswordState());

  TextEditingController oldPwdController = TextEditingController();
  TextEditingController newPwdController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  void initData() {
    emit(state.copyWith(
      isShowOldPwd: true,
      isShowNewPwd: true,
      isShowConfirmPwd: true,
      msgChangePwd: '',
    ));
  }

  void resetState() {
    emit(state.copyWith(
      onChangePassword: RequestStatus.initial,
      msgChangePwd: '',
    ));
  }

  final _datasource = GetIt.instance<ChangePasswordDatasourcesImpl>();

  Future<void> changePassword() async {
    emit(state.copyWith(onChangePassword: RequestStatus.loading));

    if (newPwdController.text.trim() == confirmController.text.trim()) {
      if (newPwdController.text.trim() == confirmController.text.trim() &&
          confirmController.text.trim() == oldPwdController.text.trim()) {
        emit(state.copyWith(
          onChangePassword: RequestStatus.failure,
          msgChangePwd: LocaleKeys.all_passwords_are_the_same.tr(),
        ));
      } else {
        if (Validation.validationPassword(newPwdController.text) == true) {
          try {
            final dataRequest = ChangePasswordModelRequest(
              oldPassword: FormatUtils().convertToMd5(oldPwdController.text),
              newPassword: FormatUtils().convertToMd5(newPwdController.text),
            );
            await _datasource
                .changePassword(dataRequest)
                .then((response) async {
              if (response.ok == false) {
                emit(
                  state.copyWith(
                    msgChangePwd: response.msg,
                    onChangePassword: RequestStatus.failure,
                  ),
                );
              } else {
                emit(
                  state.copyWith(
                    onChangePassword: RequestStatus.success,
                  ),
                );
              }
            });
          } catch (e) {
            emit(state.copyWith(onChangePassword: RequestStatus.failure));
          }
        } else {
          emit(state.copyWith(
            onChangePassword: RequestStatus.failure,
            msgChangePwd: LocaleKeys.error_change_password.tr(),
          ));
        }
      }
    } else {
      emit(state.copyWith(
        msgChangePwd: LocaleKeys.pwd_do_not_match.tr(),
        onChangePassword: RequestStatus.failure,
      ));
    }
  }

  void emitShowOldPwd(bool value) {
    emit(state.copyWith(isShowOldPwd: value));
  }

  void emitShowNewPwd(bool value) {
    emit(state.copyWith(isShowNewPwd: value));
  }

  void emitShowConfirmPwd(bool value) {
    emit(state.copyWith(isShowConfirmPwd: value));
  }
}
