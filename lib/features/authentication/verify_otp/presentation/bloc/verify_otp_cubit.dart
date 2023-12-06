import 'package:espot_power/features/index.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState>
    with LoadingMixin, ToastMixin {
  VerifyOtpCubit() : super(const VerifyOtpState());

  final _datasource = GetIt.instance<VerifyOtpDatasourcesImpl>();

  void onResetData() {
    emit(state.copyWith(
      onVerifyOtpSignup: RequestStatus.initial,
      onVerifyOtpForgotPassword: RequestStatus.initial,
      msgVerifyOtp: '',
    ));
  }

  void countdownTimer() async {
    int seconds = 60;

    while (seconds > 0) {
      await Future.delayed(Duration(seconds: 1));
      seconds--;
      emit(state.copyWith(timeResend: seconds));
    }
  }

  Future<void> verifyOtpSignup(
      {String? phoneNumber, String? otpController}) async {
    emit(state.copyWith(onVerifyOtpSignup: RequestStatus.loading));
    if (otpController != null && otpController.length > 3) {
      try {
        final dataRequest = VerifyOtpDataRequest(
          phoneNumber: phoneNumber,
          verifyCode: otpController,
        );
        await _datasource.verifyOtpSignup(dataRequest).then((response) async {
          if (response.ok == false) {
            emit(
              state.copyWith(
                msgVerifyOtp: response.msg,
                onVerifyOtpSignup: RequestStatus.failure,
              ),
            );
          } else {
            emit(
              state.copyWith(
                onVerifyOtpSignup: RequestStatus.success,
              ),
            );
          }
        });
      } catch (e) {
        emit(state.copyWith(onVerifyOtpSignup: RequestStatus.failure));
      }
    } else {
      emit(state.copyWith(
        msgVerifyOtp: 'Error',
        onVerifyOtpSignup: RequestStatus.failure,
      ));
    }
  }

  Future<void> verifyOtpForgotPassword(
      {String? phoneNumber, String? otpController}) async {
    emit(state.copyWith(onVerifyOtpForgotPassword: RequestStatus.loading));
    if (otpController != null && otpController.length > 3) {
      try {
        final dataRequest = VerifyOtpDataRequest(
          phoneNumber: phoneNumber,
          verifyCode: otpController,
        );
        await _datasource
            .verifyOtpForgotPassword(dataRequest)
            .then((response) async {
          if (response.ok == false) {
            emit(
              state.copyWith(
                msgVerifyOtp: response.msg,
                onVerifyOtpForgotPassword: RequestStatus.failure,
              ),
            );
          } else {
            emit(
              state.copyWith(
                onVerifyOtpForgotPassword: RequestStatus.success,
              ),
            );
          }
        });
      } catch (e) {
        emit(state.copyWith(onVerifyOtpForgotPassword: RequestStatus.failure));
      }
    } else {
      emit(state.copyWith(
        msgVerifyOtp: 'Error',
        onVerifyOtpForgotPassword: RequestStatus.failure,
      ));
    }
  }
}
