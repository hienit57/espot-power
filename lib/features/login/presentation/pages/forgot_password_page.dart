import 'package:bas_clean_architecture/common/ui_components/index.dart';
import 'package:bas_clean_architecture/core/enums/enums.dart';
import 'package:bas_clean_architecture/core/mixins/index.dart';
import 'package:bas_clean_architecture/core/routes/index.dart';
import 'package:bas_clean_architecture/features/login/index.dart';
import 'package:bas_clean_architecture/index.dart';
import 'package:bas_clean_architecture/theme/index.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const String routeName = '/forgot-pwd';
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with LoadingMixin {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: BackgroundAuth(
        imgPathBg: AppAssets.imBgForgotPwd,
        slogan: LocaleKeys.slogan_forgot_pwd.tr(),
        author: LocaleKeys.jonathan_jena.tr(),
        fontSize: 44.h,
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.onResetPassword == RequestStatus.loading) {
              showLoading();
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 62.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CImage(
                  assetsPath: AppAssets.icAppFreya,
                  width: 32.w,
                  height: 45.h,
                ),
                SizedBox(height: 28.h),
                const CImage(
                  assetsPath: AppAssets.imTextFreya,
                ),
                SizedBox(height: 86.h),
                CText(
                  text: '${LocaleKeys.forgot_password.tr()}?',
                  textColor: AppColors.brick,
                  fontSize: 42.h,
                  fontFamily: AppFonts.dMSerifDisplayRegular,
                ),
                SizedBox(height: 10.h),
                CText(
                  text: LocaleKeys.message_forgot_password.tr(),
                  fontSize: 18.h,
                  textAlign: TextAlign.center,
                  lineSpacing: 1.8.h,
                ),
                SizedBox(height: 151.h),
                AppTextField(
                  controller:
                      BlocProvider.of<LoginCubit>(context).emailController,
                  borderRadius: 150,
                  placeholder: LocaleKeys.email_address.tr(),
                  obscureText: false,
                  validator: (text) {
                    if (text == null) {
                      return LocaleKeys.field_cant_be_empty.tr();
                    }
                    return null;
                  },
                ),
                SizedBox(height: 67.h),
                CButton(
                  radius: 150,
                  height: 56.h,
                  width: double.infinity,
                  titleFontSize: 18.h,
                  titleFontWeight: FontWeight.bold,
                  onPressed: () => BlocProvider.of<LoginCubit>(context)
                      .resetPassword(context),
                  backgroundColor: AppColors.vividTangerine,
                  title: LocaleKeys.reset_password.tr(),
                  titleColor: Colors.white,
                ),
                SizedBox(height: 10.h),
                CButton(
                  radius: 150,
                  height: 56.h,
                  width: double.infinity,
                  titleFontSize: 18.h,
                  titleFontWeight: FontWeight.bold,
                  onPressed: () => context.pop(context),
                  backgroundColor: AppColors.white,
                  title: LocaleKeys.back_to_login.tr(),
                  titleColor: AppColors.charcoal,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
