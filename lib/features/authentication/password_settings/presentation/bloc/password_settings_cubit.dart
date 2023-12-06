import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/utils/index.dart';
import 'package:flutter/widgets.dart';

part 'password_settings_state.dart';

class PasswordSettingsCubit extends Cubit<PasswordSettingsState>
    with LoadingMixin, ToastMixin {
  PasswordSettingsCubit() : super(const PasswordSettingsState());

  final _datasource = GetIt.instance<PasswordSettingsDatasourcesImpl>();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void initData() {
    emit(state.copyWith(
      isShowYourPassword: true,
      isShowConfirmPassword: true,
    ));
  }

  void resetState() {
    emit(state.copyWith(
      onCreatePassword: RequestStatus.initial,
      onUpdateNewPassword: RequestStatus.initial,
      msgCreatePassword: '',
    ));
  }

  Future<void> createPassword(
      {String? phoneNumber, String? referrerPhone}) async {
    emit(state.copyWith(onCreatePassword: RequestStatus.loading));
    if (passwordController.text.trim() ==
        confirmPasswordController.text.trim()) {
      if (Validation.validationPassword(passwordController.text) == true) {
        try {
          final dataRequest = PasswordSettingsModelRequest(
            name: phoneNumber,
            phoneNumber: phoneNumber,
            password: FormatUtils().convertToMd5(passwordController.text),
            referralNumber: referrerPhone,
          );
          await _datasource.createPassword(dataRequest).then((response) async {
            if (response.ok == false) {
              emit(
                state.copyWith(
                  msgCreatePassword: response.msg,
                  onCreatePassword: RequestStatus.failure,
                ),
              );
            } else {
              final dataResponse = UserData.fromJson(response.obj);

              await SharedPrefsHelper.saveAccessToken(dataResponse.token ?? "");

              emit(
                state.copyWith(
                  onCreatePassword: RequestStatus.success,
                ),
              );
            }
          });
        } catch (e) {
          emit(state.copyWith(onCreatePassword: RequestStatus.failure));
        }
      } else {
        emit(state.copyWith(
          msgCreatePassword: LocaleKeys.pwd_is_missing_character.tr(),
          onCreatePassword: RequestStatus.failure,
        ));
      }
    } else {
      emit(state.copyWith(
        msgCreatePassword: LocaleKeys.pwd_do_not_match.tr(),
        onCreatePassword: RequestStatus.failure,
      ));
    }
  }

  Future<void> updateNewPassword({String? phoneNumber}) async {
    emit(state.copyWith(onUpdateNewPassword: RequestStatus.loading));
    if (passwordController.text.trim() ==
        confirmPasswordController.text.trim()) {
      if (Validation.validationPassword(passwordController.text) == true) {
        try {
          final dataRequest = PasswordSettingsModelRequest(
            phoneNumber: phoneNumber,
            password: FormatUtils().convertToMd5(passwordController.text),
          );
          await _datasource
              .updateNewPassword(dataRequest)
              .then((response) async {
            if (response.ok == false) {
              emit(
                state.copyWith(
                  msgCreatePassword: response.msg,
                  onUpdateNewPassword: RequestStatus.failure,
                ),
              );
            } else {
              final dataResponse = UserData.fromJson(response.obj);

              await SharedPrefsHelper.saveAccessToken(dataResponse.token ?? "");
              emit(
                state.copyWith(
                  onUpdateNewPassword: RequestStatus.success,
                ),
              );
            }
          });
        } catch (e) {
          emit(state.copyWith(onUpdateNewPassword: RequestStatus.failure));
        }
      } else {
        emit(state.copyWith(
          msgCreatePassword: LocaleKeys.pwd_is_missing_character.tr(),
          onUpdateNewPassword: RequestStatus.failure,
        ));
      }
    } else {
      emit(state.copyWith(
        msgCreatePassword: LocaleKeys.pwd_do_not_match.tr(),
        onUpdateNewPassword: RequestStatus.failure,
      ));
    }
  }

  void emitShowYourPassword(bool value) {
    emit(state.copyWith(isShowYourPassword: value));
  }

  void emitShowConfirmPassword(bool value) {
    emit(state.copyWith(isShowConfirmPassword: value));
  }
}
