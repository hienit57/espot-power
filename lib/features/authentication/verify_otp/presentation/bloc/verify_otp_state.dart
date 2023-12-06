part of 'verify_otp_cubit.dart';

class VerifyOtpState extends Equatable {
  final RequestStatus? onVerifyOtpSignup;
  final RequestStatus? onVerifyOtpForgotPassword;
  final String? msgVerifyOtp;

  final int? timeResend;

  const VerifyOtpState({
    this.onVerifyOtpSignup,
    this.onVerifyOtpForgotPassword,
    this.msgVerifyOtp,
    this.timeResend,
  });

  VerifyOtpState copyWith({
    RequestStatus? onVerifyOtpSignup,
    RequestStatus? onVerifyOtpForgotPassword,
    String? msgVerifyOtp,
    int? timeResend,
  }) {
    return VerifyOtpState(
      onVerifyOtpSignup: onVerifyOtpSignup ?? this.onVerifyOtpSignup,
      onVerifyOtpForgotPassword:
          onVerifyOtpForgotPassword ?? this.onVerifyOtpForgotPassword,
      msgVerifyOtp: msgVerifyOtp ?? this.msgVerifyOtp,
      timeResend: timeResend ?? this.timeResend,
    );
  }

  @override
  List<Object?> get props => [
        onVerifyOtpSignup,
        onVerifyOtpForgotPassword,
        msgVerifyOtp,
        timeResend,
      ];
}
