import 'package:bas_clean_architecture/core/enums/enums.dart';
import 'package:bas_clean_architecture/core/mixins/index.dart';
import 'package:bas_clean_architecture/core/routes/navigator_ext.dart';
import 'package:bas_clean_architecture/extensions/string_extensions.dart';
import 'package:bas_clean_architecture/features/login/data/data_cached_clients/login_data_cached.dart';
import 'package:bas_clean_architecture/features/login/data/data_sources/login_data_source.dart';
import 'package:bas_clean_architecture/features/login/data/models/login_response_model.dart';
import 'package:bas_clean_architecture/features/login/presentation/pages/forgot_password_success.dart';
import 'package:bas_clean_architecture/service/firebase_auth/firebase_auth.dart';
import 'package:bas_clean_architecture/index.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> with LoadingMixin, ToastMixin {
  LoginCubit() : super(const LoginState());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _datasource = GetIt.instance<LoginDataSource>();

  void checkIsColorLightButtonLogin() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      emit(state.copyWith(isColorLightButtonLogin: true));
    } else {
      emit(state.copyWith(isColorLightButtonLogin: false));
    }
  }

  void login(BuildContext context) async {
    showLoading();
    emit(state.copyWith(onLogin: RequestStatus.loading));

    try {
      if (emailController.value.text.isValidEmail() == true &&
          passwordController.value.text.isNotEmpty) {
        _datasource
            .login(
                email: emailController.text.trim(),
                password: passwordController.text.trim())
            .then((response) async {
          if (response?.status == 0) {
            validateLogin(value: false);
            emit(state.copyWith(
              onLogin: RequestStatus.failure,
            ));
            dismissloading();
          } else if (response?.data != null) {
            await DataUserLoginCachedClient.instance.storeData(response);
            emit(state.copyWith(
              onLogin: RequestStatus.success,
              loginResponse: response?.data,
            ));
          }
        });
      } else {
        dismissloading();
        emit(state.copyWith(onLogin: RequestStatus.failure));
      }
      dismissloading();
    } catch (e) {
      dismissloading();

      emit(state.copyWith(onLogin: RequestStatus.failure));
    }
  }

  void refreshToken() async {
    try {
      final dataUserLocal = await DataUserLoginCachedClient.instance.getData();

      await _datasource
          .refreshToken(userId: dataUserLocal?.data?.iD)
          .then((response) async {
        if (response?.data != null) {
          await DataUserLoginCachedClient.instance.storeData(response);
        }
      });
    } catch (e) {
      dismissloading();
    }
  }

  void resetPassword(
    BuildContext context,
  ) async {
    emit(state.copyWith(onResetPassword: RequestStatus.loading));

    try {
      if (emailController.value.text.isValidEmail() == true) {
        await FirebaseAuthentication.instance.resetPassword(context,
            email: emailController.text.trim(), onFailed: (err) {
          showToast(
              message: err,
              toastLenght: Toast.LENGTH_SHORT,
              toastGravity: ToastGravity.TOP);
        }, onSuccess: () {
          emit(state.copyWith(onResetPassword: RequestStatus.success));
          if (state.onResetPassword == RequestStatus.success) {
            NavigatorExt.push(context, const ForgotPasswordSuccess());
          }
        });
      }

      dismissloading();
    } catch (e) {
      dismissloading();

      emit(state.copyWith(onResetPassword: RequestStatus.failure));
    }
  }

  void validateLogin({bool? value}) {
    emit(state.copyWith(isErrorWrongEmailOrPassword: value));
  }
}
