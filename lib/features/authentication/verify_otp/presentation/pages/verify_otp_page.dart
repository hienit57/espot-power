import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/const.dart';
import 'package:espot_power/core/mixins/dialog_mixin.dart';
import 'package:espot_power/core/routes/app_pages.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:espot_power/utils/index.dart';
import 'package:flutter/material.dart';

class VerifyOtpPage extends StatefulWidget {
  final String? phoneNumber;
  final FromPage? fromPage;

  const VerifyOtpPage({
    super.key,
    this.phoneNumber,
    this.fromPage,
  });

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> with DialogMixin {
  late VerifyOtpCubit _verifyOtpCubit;

  @override
  void initState() {
    _verifyOtpCubit = BlocProvider.of<VerifyOtpCubit>(context);
    _verifyOtpCubit.countdownTimer();

    super.initState();
  }

  @override
  void dispose() {
    _verifyOtpCubit.onResetData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CBackgroundAuthWidget(
      isPop: true,
      child: BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
        listenWhen: (previous, current) =>
            previous.onVerifyOtpSignup != current.onVerifyOtpSignup ||
            previous.onVerifyOtpForgotPassword !=
                current.onVerifyOtpForgotPassword,
        buildWhen: (previous, current) =>
            previous.onVerifyOtpSignup != current.onVerifyOtpSignup ||
            previous.onVerifyOtpForgotPassword !=
                current.onVerifyOtpForgotPassword,
        listener: (context, state) {
          if (state.onVerifyOtpSignup == RequestStatus.success) {
            NavigatorExt.pushAndRemoveUntil(
                context,
                VerifyReferrerPage(
                  phoneNumber: widget.phoneNumber,
                ),
                AppRoutes.verifyOtp);
          }
          if (state.onVerifyOtpForgotPassword == RequestStatus.success) {
            NavigatorExt.pushAndRemoveUntil(
                context,
                PasswordSettingsPage(
                  fromPage: widget.fromPage,
                  phoneNumber: widget.phoneNumber,
                ),
                AppRoutes.verifyOtp);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Center(
                child: CText(
                  lineSpacing: 1.2,
                  text: LocaleKeys.enter_confirm_code.tr(),
                  textColor: AppColors.colorText514D56,
                ),
              ),
              const SizedBox(height: 11),
              Center(
                child: CText(
                  textAlign: TextAlign.center,
                  lineSpacing: 1.2,
                  text: widget.phoneNumber,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 22),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 76),
                child: COtpWidget(
                  isError: state.msgVerifyOtp != null ||
                      state.msgVerifyOtp == 'Error',
                  onChanged: (value) {
                    _verifyOtpCubit.onResetData();
                  },
                  onCompleted: (value) {
                    if (widget.fromPage == FromPage.signUp) {
                      _verifyOtpCubit.verifyOtpSignup(
                        phoneNumber: widget.phoneNumber,
                        otpController: value,
                      );
                    } else {
                      _verifyOtpCubit.verifyOtpForgotPassword(
                        phoneNumber: widget.phoneNumber,
                        otpController: value,
                      );
                    }
                  },
                ),
              ),
              if (state.msgVerifyOtp != null &&
                  state.msgVerifyOtp != 'Error') ...[
                Center(
                  child: CText(
                    fontSize: 13,
                    textColor: AppColors.colorEC222D,
                    fontWeight: FontWeight.w400,
                    lineSpacing: 1,
                    text: state.msgVerifyOtp,
                  ),
                ),
                const SizedBox(height: 12),
              ] else ...[
                const SizedBox(height: 19),
              ],
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 112),
                child: CButton(
                  height: 40,
                  width: double.infinity,
                  radius: 10,
                  backgroundColor: AppColors.colorFFCB08,
                  title: LocaleKeys.continues.tr(),
                  titleFontWeight: FontWeight.w500,
                  onPressed: () {
                    if (widget.fromPage == FromPage.signUp) {
                      _verifyOtpCubit.verifyOtpSignup();
                    } else {
                      _verifyOtpCubit.verifyOtpForgotPassword();
                    }
                  },
                ),
              ),
              const SizedBox(height: 14),
              BlocBuilder<VerifyOtpCubit, VerifyOtpState>(
                buildWhen: (previous, current) =>
                    previous.timeResend != current.timeResend,
                builder: (context, state) {
                  if (state.timeResend == 0) {
                    return Column(
                      children: [
                        Center(
                            child: CText(
                          textDecoration: TextDecoration.underline,
                          lineSpacing: 1,
                          text: LocaleKeys.code_new.tr(),
                          onTap: () {
                            _verifyOtpCubit.countdownTimer();

                            if (widget.fromPage == FromPage.signUp) {
                              BlocProvider.of<VerifyUserExistsCubit>(context)
                                  .verifyUserExist();
                            } else {
                              BlocProvider.of<ForgotPasswordCubit>(context)
                                  .forgotPassword();
                            }
                          },
                        )),
                        const SizedBox(height: 28),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: CContainer(
                            width: double.infinity,
                            radius: 4,
                            onTap: () {
                              onContactSupport();
                            },
                            backgroundColor: AppColors.white.withOpacity(0.7),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              child: Row(
                                children: [
                                  const CImage(
                                    assetsPath: AppAssets.iconSignupTelephone,
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: CText(
                                      text: LocaleKeys.enter_contact_resent_code
                                          .tr(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return RichText(
                    text: TextSpan(
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: AppColors.colorText514D56,
                          wordSpacing: 1,
                          fontFamily: AppFonts.svnGotham),
                      children: <TextSpan>[
                        TextSpan(
                            text: LocaleKeys.require_sent_code.tr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                            )),
                        TextSpan(
                          text: '${state.timeResend ?? 60}s',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }

  void onContactSupport() {
    cShowGeneralDialog(
      context,
      widget: Align(
        alignment: Alignment.center,
        child: IntrinsicHeight(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 37),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 38),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CImage(
                      assetsPath: AppAssets.iconSignupTelephone,
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 12),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: AppColors.colorText231F20,
                          wordSpacing: 1.6,
                          fontFamily: AppFonts.svnGotham,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: LocaleKeys.telephone_hotline.tr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: LocaleKeys.espot_power.tr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 38),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: CButton(
                          height: 40,
                          radius: 10,
                          borderColor: AppColors.colorBorder,
                          backgroundColor: AppColors.colorBorder,
                          title: LocaleKeys.skip.tr(),
                          titleFontWeight: FontWeight.w500,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 1,
                        child: CButton(
                          height: 40,
                          radius: 10,
                          borderColor: AppColors.colorFFCB08,
                          backgroundColor: AppColors.colorFFCB08,
                          title: LocaleKeys.call_now.tr(),
                          titleFontWeight: FontWeight.w500,
                          onPressed: () {
                            CallServiceContact().call(telephoneCompany);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 36),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
