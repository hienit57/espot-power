import 'package:espot_power/core/routes/app_pages.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/utils/index.dart';
import 'package:flutter/widgets.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> with LoadingMixin, ToastMixin {
  LoginCubit() : super(const LoginState());

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _datasource = GetIt.instance<LoginDatasourcesImpl>();

  void initData({String? phoneNumber}) {
    phoneController.text = phoneNumber ?? '';
    passwordController.text = '';

    emit(state.copyWith(isShowPassword: true));
  }

  void resetState() {
    emit(state.copyWith(
      onLogin: RequestStatus.initial,
      msgLogin: '',
    ));
  }

  Future<void> login() async {
    emit(state.copyWith(onLogin: RequestStatus.loading));

    try {
      final dataRequest = LoginModelRequest(
        phoneNumber: phoneController.text,
        password: FormatUtils().convertToMd5(passwordController.text),
      );
      await _datasource.login(dataRequest).then((response) async {
        if (response.code != 10) {
          emit(state.copyWith(
            msgLogin: response.msg,
            onLogin: RequestStatus.failure,
          ));
        } else {
          final dataResponse = UserData.fromJson(response.obj);
          await SharedPrefsHelper.saveAccessToken(dataResponse.token ?? "");
          emit(state.copyWith(
            msgLogin: '',
            onLogin: RequestStatus.success,
          ));
          NavigatorExt.pushAndRemoveUntil(
              AppContext.navigatorKey.currentContext!,
              const HomePage(),
              AppRoutes.login);
        }
      });
    } catch (e) {
      emit(state.copyWith(onLogin: RequestStatus.failure));
    }
  }

  void emitShowPassword(bool value) {
    emit(state.copyWith(isShowPassword: value));
  }
}
