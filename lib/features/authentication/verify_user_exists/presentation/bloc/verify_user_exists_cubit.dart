import 'package:espot_power/core/routes/app_pages.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/utils/index.dart';
import 'package:flutter/material.dart';

part 'verify_user_exists_state.dart';

class VerifyUserExistsCubit extends Cubit<VerifyUserExistsState>
    with LoadingMixin, ToastMixin {
  VerifyUserExistsCubit() : super(const VerifyUserExistsState());

  final phoneController = TextEditingController();

  final _datasource = GetIt.instance<VerifyUserDatasourcesImpl>();

  void initData() {
    phoneController.text = '';
  }

  void resetState() {
    emit(state.copyWith(
      onVerifyUserExists: RequestStatus.initial,
      msgVerifyUserExists: '',
    ));
  }

  Future<void> verifyUserExist() async {
    emit(state.copyWith(onVerifyUserExists: RequestStatus.loading));

    try {
      if (Validation.validationPhone(phoneController.text) == false) {
        emit(
          state.copyWith(
            msgVerifyUserExists: LocaleKeys.phone_not_correct_format.tr(),
            onVerifyUserExists: RequestStatus.failure,
          ),
        );
      } else {
        final dataRequest =
            VerifyUserExistModelRequest(phoneNumber: phoneController.text);
        await _datasource.verifyUserExist(dataRequest).then((response) async {
          switch (response.code) {
            case -13:
              NavigatorExt.pushAndRemoveUntil(
                AppContext.navigatorKey.currentContext!,
                LoginPage(
                  phoneNumber: phoneController.text,
                ),
                AppRoutes.verifyUserExists,
              );
              break;
            case 15:
              emit(state.copyWith(
                msgVerifyUserExists: '',
                onVerifyUserExists: RequestStatus.success,
              ));
              NavigatorExt.push(
                AppContext.navigatorKey.currentContext!,
                VerifyOtpPage(
                  fromPage: FromPage.signUp,
                  phoneNumber: phoneController.text,
                ),
              );
              break;
            default:
              emit(state.copyWith(
                msgVerifyUserExists: response.msg,
                onVerifyUserExists: RequestStatus.failure,
              ));
              break;
          }
        });
      }
    } catch (e) {
      emit(state.copyWith(onVerifyUserExists: RequestStatus.failure));
    }
  }
}
