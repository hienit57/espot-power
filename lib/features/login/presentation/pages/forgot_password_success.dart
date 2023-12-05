import 'package:bas_clean_architecture/common/ui_components/index.dart';
import 'package:bas_clean_architecture/features/login/index.dart';
import 'package:bas_clean_architecture/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:bas_clean_architecture/index.dart';

class ForgotPasswordSuccess extends StatelessWidget {
  const ForgotPasswordSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: BackgroundAuth(
        imgPathBg: AppAssets.imBgForgotPwd,
        slogan: LocaleKeys.slogan_reset_pwd.tr(),
        author: LocaleKeys.janelle_monae.tr(),
        fontSize: 44.h,
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
                text: '${LocaleKeys.success.tr()}!',
                textColor: AppColors.brick,
                fontSize: 42.h,
                fontFamily: AppFonts.dMSerifDisplayRegular,
              ),
              SizedBox(height: 74.h),
              CText(
                text: 'Please check your email',
                //LocaleKeys.message_reset_password.tr(),
                fontSize: 18.h,
                textAlign: TextAlign.center,
                lineSpacing: 1.8.h,
              ),
              SizedBox(height: 210.h),
              CButton(
                radius: 150,
                height: 56.h,
                width: double.infinity,
                titleFontSize: 18.h,
                titleFontWeight: FontWeight.bold,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                backgroundColor: AppColors.vividTangerine,
                title: LocaleKeys.back_to_login.tr(),
                titleColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
