import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:flutter/widgets.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState>
    with LoadingMixin, ToastMixin {
  ForgotPasswordCubit() : super(const ForgotPasswordState());

  final phoneController = TextEditingController();

  final _datasource = GetIt.instance<ForgotPasswordDatasourcesImpl>();

  Future<void> forgotPassword() async {
    emit(state.copyWith(onForgotPassword: RequestStatus.loading));

    try {
      await _datasource
          .forgotPassword(phoneController.text)
          .then((response) async {
        if (response.code != 15) {
          emit(state.copyWith(
            msgForgotPassword: response.msg,
            onForgotPassword: RequestStatus.failure,
          ));
        } else {
          emit(state.copyWith(
            onForgotPassword: RequestStatus.success,
          ));
          NavigatorExt.push(
              AppContext.navigatorKey.currentContext!,
              VerifyOtpPage(
                fromPage: FromPage.forgotPassword,
                phoneNumber: phoneController.text,
              ));
        }
      });
    } catch (e) {
      emit(state.copyWith(
        msgForgotPassword: '',
        onForgotPassword: RequestStatus.failure,
      ));
    }
  }
}
