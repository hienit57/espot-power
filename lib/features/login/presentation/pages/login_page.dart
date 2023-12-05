import 'package:bas_clean_architecture/common/ui_components/index.dart';
import 'package:bas_clean_architecture/core/enums/enums.dart';
import 'package:bas_clean_architecture/core/mixins/index.dart';
import 'package:bas_clean_architecture/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:bas_clean_architecture/features/login/index.dart';
import 'package:bas_clean_architecture/index.dart';
import 'package:bas_clean_architecture/core/routes/index.dart';
import 'package:bas_clean_architecture/core/routes/navigator_ext.dart';
import 'package:bas_clean_architecture/extensions/string_extensions.dart';
import 'package:bas_clean_architecture/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/Authentication';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoadingMixin {
  late LoginCubit _cubit;
  FocusNode? _focusNode;
  RawKeyEvent? _currentEvent;

  @override
  void dispose() {
    _focusNode?.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    if (_focusNode!.hasFocus) {
      RawKeyboard.instance.addListener(_handleKeyEvent);
    } else {
      RawKeyboard.instance.removeListener(_handleKeyEvent);
    }
  }

  void _handleKeyEvent(RawKeyEvent event) {
    if (event is RawKeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.enter) {
      // Xử lý sự kiện khi nhấn Enter trên bàn phím
      _handleEnterEvent();
    }
  }

  void _handleEnterEvent() {
    _cubit.login(context);
  }

  @override
  void initState() {
    _focusNode = FocusNode();
    _focusNode?.addListener(_handleFocusChange);
    _cubit = BlocProvider.of<LoginCubit>(context);
    _cubit.checkIsColorLightButtonLogin();
    _cubit.validateLogin(value: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: BackgroundAuth(
        imgPathBg: AppAssets.imBgLogin,
        slogan: LocaleKeys.slogan_login.tr(),
        author: LocaleKeys.coco_chanel.tr(),
        fontSize: 55.sp,
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.onLogin == RequestStatus.loading) {
              showLoading();
            }
            if (state.onLogin == RequestStatus.failure) {
              dismissloading();
            }

            if (state.onLogin == RequestStatus.success) {
              dismissloading();
              context.go(Dashboard.routeName);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 62.0),
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(_focusNode);
                  },
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 155.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CImage(
                            assetsPath: AppAssets.icAppFreya,
                            width: 32.w,
                            height: 45.h,
                            boxFit: BoxFit.cover,
                          ),
                          const SizedBox(height: 28),
                          CImage(
                            assetsPath: AppAssets.imTextFreya,
                            width: 126.w,
                            height: 19.h,
                          ),
                          const SizedBox(height: 86),
                          CText(
                            text: LocaleKeys.wellcome_back.tr(),
                            textColor: AppColors.brick,
                            fontSize: 42,
                            fontFamily: AppFonts.dMSerifDisplayRegular,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 18.h),
                          CText(
                            text: LocaleKeys.please_enter_your_detail.tr(),
                            fontSize: 18,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 113.h),
                        ],
                      ),

                      AppTextField(
                        controller: BlocProvider.of<LoginCubit>(context)
                            .emailController,
                        borderRadius: 150,
                        borderColor: AppColors.charcoal.withOpacity(0.3),
                        onChanged: (value) {
                          _cubit.checkIsColorLightButtonLogin();
                          _cubit.validateLogin(value: true);
                        },
                        fontSize: 14,
                        validator: (text) {
                          if (text == null) {
                            return LocaleKeys.field_cant_be_empty.tr();
                          } else if (text.isValidEmail() == false) {
                            return LocaleKeys.invalid_email.tr();
                          }
                          return null;
                        },
                        placeholder: LocaleKeys.email_address.tr(),
                      ),
                      //),
                      SizedBox(height: 14.h),
                      AppTextField(
                        controller: _cubit.passwordController,
                        borderRadius: 150,
                        placeholder: LocaleKeys.password.tr(),
                        borderColor: AppColors.charcoal.withOpacity(0.3),
                        obscureText: true,
                        fontSize: 14,
                        onChanged: (value) {
                          _cubit.checkIsColorLightButtonLogin();
                          _cubit.validateLogin(value: true);
                        },
                        onFieldSubmitted: (p0) => _cubit.login(context),
                      ),
                      SizedBox(height: 18.h),
                      Align(
                        alignment: Alignment.topRight,
                        child: CText(
                          text: LocaleKeys.forgot_password.tr(),
                          fontSize: 18.sp,
                          tappedText: () => NavigatorExt.push(
                              context, const ForgotPasswordPage()),
                        ),
                      ),
                      state.isErrorWrongEmailOrPassword == false
                          ? Column(
                              children: [
                                SizedBox(height: 10.h),
                                CText(
                                  textAlign: TextAlign.center,
                                  text: LocaleKeys.error_wrong_email_or_password
                                      .tr(),
                                  fontFamily: AppFonts.dMSerifDisplayRegular,
                                  textColor: AppColors.error,
                                  fontSize: 16,
                                ),
                                SizedBox(height: 73.h),
                              ],
                            )
                          : SizedBox(height: 103.h),
                      CButton(
                        radius: 150,
                        height: 60.h,
                        titleFontSize: 18.sp,
                        titleFontWeight: FontWeight.bold,
                        onPressed: () => _cubit.login(context),
                        backgroundColor: state.isColorLightButtonLogin == false
                            ? AppColors.vividTangerine.withOpacity(0.6)
                            : AppColors.vividTangerine,
                        title: LocaleKeys.login.tr(),
                        titleColor: Colors.white,
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
