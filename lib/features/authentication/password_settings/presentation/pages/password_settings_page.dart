import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/mixins/dialog_mixin.dart';
import 'package:espot_power/core/routes/app_pages.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/widgets.dart';

class PasswordSettingsPage extends StatelessWidget with DialogMixin {
  final String? phoneNumber;
  final String? referrerNumber;
  final FromPage? fromPage;

  const PasswordSettingsPage({
    super.key,
    this.phoneNumber,
    this.referrerNumber,
    this.fromPage,
  });

  @override
  Widget build(BuildContext context) {
    final _passwordSettingsCubit =
        BlocProvider.of<PasswordSettingsCubit>(context);
    _passwordSettingsCubit.initData();
    return BlocBuilder<PasswordSettingsCubit, PasswordSettingsState>(
      builder: (context, state) {
        return CBackgroundAuthWidget(
          child: Column(
            children: [
              CText(
                lineSpacing: 1.2,
                text: fromPage == FromPage.signUp
                    ? LocaleKeys.password_create.tr()
                    : LocaleKeys.enter_new_password.tr(),
                fontSize: 16,
                textColor: AppColors.colorText514D56,
              ),
              const SizedBox(height: 33),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child:
                    BlocBuilder<PasswordSettingsCubit, PasswordSettingsState>(
                  buildWhen: (previous, current) =>
                      previous.isShowYourPassword != current.isShowYourPassword,
                  builder: (context, state) {
                    return AppTextField(
                      obscureText: state.isShowYourPassword ?? false,
                      controller: _passwordSettingsCubit.passwordController,
                      placeholder: fromPage == FromPage.signUp
                          ? LocaleKeys.your_password.tr()
                          : LocaleKeys.new_password.tr(),
                      borderRadius: 10,
                      prefix: const Padding(
                        padding: EdgeInsets.all(11.0),
                        child: CImage(
                          assetsPath: AppAssets.iconSignupLock,
                        ),
                      ),
                      suffix: GestureDetector(
                        onTap: () =>
                            _passwordSettingsCubit.emitShowYourPassword(
                                !(state.isShowYourPassword ?? true)),
                        child: CImage(
                          assetsPath: state.isShowYourPassword == true
                              ? AppAssets.iconEyeShow
                              : AppAssets.iconEyeHidden,
                        ),
                      ),
                      onChanged: (value) {
                        _passwordSettingsCubit.resetState();
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child:
                    BlocBuilder<PasswordSettingsCubit, PasswordSettingsState>(
                  buildWhen: (previous, current) =>
                      previous.isShowConfirmPassword !=
                      current.isShowConfirmPassword,
                  builder: (context, state) {
                    return AppTextField(
                      obscureText: state.isShowConfirmPassword ?? true,
                      controller:
                          _passwordSettingsCubit.confirmPasswordController,
                      placeholder: LocaleKeys.confirm_password.tr(),
                      borderRadius: 10,
                      prefix: const Padding(
                        padding: EdgeInsets.all(11.0),
                        child: CImage(
                          assetsPath: AppAssets.iconSignupLock,
                        ),
                      ),
                      suffix: GestureDetector(
                        onTap: () =>
                            _passwordSettingsCubit.emitShowConfirmPassword(
                                !(state.isShowConfirmPassword ?? true)),
                        child: CImage(
                          assetsPath: state.isShowConfirmPassword == true
                              ? AppAssets.iconEyeShow
                              : AppAssets.iconEyeHidden,
                        ),
                      ),
                      onChanged: (value) {
                        _passwordSettingsCubit.resetState();
                      },
                    );
                  },
                ),
              ),
              BlocConsumer<PasswordSettingsCubit, PasswordSettingsState>(
                bloc: BlocProvider.of<PasswordSettingsCubit>(context),
                buildWhen: (previous, current) =>
                    previous.onCreatePassword != current.onCreatePassword ||
                    previous.onUpdateNewPassword != current.onUpdateNewPassword,
                listenWhen: (previous, current) =>
                    previous.onCreatePassword != current.onCreatePassword ||
                    previous.onUpdateNewPassword != current.onUpdateNewPassword,
                listener: (context, state) {
                  if (state.onCreatePassword == RequestStatus.success) {
                    showMessageCreateSuccess(context);
                  }

                  if (state.onUpdateNewPassword == RequestStatus.success) {
                    showMessageCreateSuccess(context);
                  }
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      const SizedBox(height: 12),
                      CText(
                        fontSize: 13,
                        textColor: AppColors.colorEC222D,
                        fontWeight: FontWeight.w400,
                        lineSpacing: 1,
                        text: state.msgCreatePassword,
                      ),
                      const SizedBox(height: 12),
                    ],
                  );
                },
              ),
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
                    if (fromPage == FromPage.forgotPassword) {
                      _passwordSettingsCubit.updateNewPassword(
                        phoneNumber: phoneNumber,
                      );
                    } else {
                      _passwordSettingsCubit.createPassword(
                        phoneNumber: phoneNumber,
                        referrerPhone: referrerNumber,
                      );
                    }
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void showMessageCreateSuccess(BuildContext context) {
    cShowGeneralDialog(
      context,
      isTapOutSide: false,
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
                const SizedBox(height: 54),
                const CImage(
                  assetsPath: AppAssets.iconCheckSuccess,
                  width: 72,
                  height: 72,
                ),
                const SizedBox(height: 24),
                CText(
                  textAlign: TextAlign.center,
                  lineSpacing: 1.2,
                  text: fromPage == FromPage.forgotPassword
                      ? LocaleKeys.password_create_success_2.tr()
                      : LocaleKeys.password_create_success.tr(),
                  fontSize: 14,
                  textColor: AppColors.colorText514D56,
                ),
                const SizedBox(height: 36),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 89),
                  child: CButton(
                    height: 40,
                    width: double.infinity,
                    radius: 10,
                    backgroundColor: AppColors.colorFFCB05,
                    borderColor: AppColors.colorFFCB05,
                    title: LocaleKeys.agree.tr(),
                    titleFontWeight: FontWeight.w500,
                    onPressed: () {
                      NavigatorExt.pushAndRemoveUntil(context, const HomePage(),
                          AppRoutes.passwordSettings);
                    },
                  ),
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
