import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/routes/app_pages.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final String? phoneNumber;
  const LoginPage({
    Key? key,
    this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _loginCubit = BlocProvider.of<LoginCubit>(context);
    _loginCubit.initData(phoneNumber: phoneNumber);
    return CBackgroundAuthWidget(
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 16,
                color: AppColors.colorText514D56,
                wordSpacing: 1.6,
                fontFamily: AppFonts.svnGotham,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: LocaleKeys.wellcome_to.tr(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: '${LocaleKeys.espot.tr()} Power',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 33),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: AppTextField(
              controller: _loginCubit.phoneController,
              placeholder: LocaleKeys.telephone.tr(),
              borderRadius: 10,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              prefix: const Padding(
                padding: EdgeInsets.all(11.0),
                child: CImage(
                  assetsPath: AppAssets.iconSignupTelephone,
                ),
              ),
              onChanged: (value) {
                _loginCubit.resetState();
              },
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BlocBuilder<LoginCubit, LoginState>(
              buildWhen: (previous, current) =>
                  previous.isShowPassword != current.isShowPassword,
              builder: (context, state) {
                return AppTextField(
                  obscureText: state.isShowPassword ?? false,
                  controller: _loginCubit.passwordController,
                  placeholder: LocaleKeys.your_password.tr(),
                  borderRadius: 10,
                  prefix: const Padding(
                    padding: EdgeInsets.all(11.0),
                    child: CImage(
                      assetsPath: AppAssets.iconSignupLock,
                    ),
                  ),
                  suffix: GestureDetector(
                    onTap: () => _loginCubit
                        .emitShowPassword(!(state.isShowPassword ?? true)),
                    child: CImage(
                      assetsPath: state.isShowPassword == true
                          ? AppAssets.iconEyeShow
                          : AppAssets.iconEyeHidden,
                    ),
                  ),
                  onChanged: (value) {
                    _loginCubit.resetState();
                  },
                );
              },
            ),
          ),
          BlocBuilder<LoginCubit, LoginState>(
            buildWhen: (previous, current) =>
                previous.onLogin != current.onLogin,
            builder: (context, state) {
              return Column(
                children: [
                  const SizedBox(height: 12),
                  CText(
                    fontSize: 13,
                    textColor: AppColors.colorEC222D,
                    fontWeight: FontWeight.w400,
                    lineSpacing: 1,
                    text: state.msgLogin,
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
                _loginCubit.login();
              },
            ),
          ),
          const SizedBox(height: 24),
          CText(
            lineSpacing: 1,
            text: LocaleKeys.password_forgot.tr(),
            onTap: () {
              BlocProvider.of<VerifyUserExistsCubit>(context)
                  .phoneController
                  .clear();
              Navigator.pushNamed(AppContext.navigatorKey.currentContext!,
                  AppRoutes.forgotPassword);
            },
            textDecoration: TextDecoration.underline,
          )
        ],
      ),
    );
  }
}
