import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/mixins/dialog_mixin.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/widgets.dart';

class ChangePasswordPage extends StatelessWidget with DialogMixin {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _changePwdCubit = BlocProvider.of<ChangePasswordCubit>(context);

    return BaseWrapperWidget(
      onReturn: () {
        NavigatorExt.push(AppContext.navigatorKey.currentContext!,
            const ViewPersonalInformationPage());
      },
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listenWhen: (previous, current) =>
            previous.onChangePassword != current.onChangePassword,
        listener: (context, state) {
          if (state.onChangePassword == RequestStatus.success) {
            _showDialogChangePwdSuccess(
              context,
              onConfirm: () {
                _changePwdCubit.oldPwdController.clear();
                _changePwdCubit.newPwdController.clear();
                _changePwdCubit.confirmController.clear();

                _changePwdCubit.resetState();
                Navigator.pop(context);
              },
            );
          }
        },
        buildWhen: (previous, current) =>
            previous.isShowOldPwd != current.isShowOldPwd ||
            previous.isShowNewPwd != current.isShowNewPwd ||
            previous.isShowConfirmPwd != current.isShowConfirmPwd ||
            previous.onChangePassword != current.onChangePassword,
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(height: 24),
              CText(
                text: LocaleKeys.change_password_2.tr(),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 36),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AppTextField(
                  obscureText: state.isShowOldPwd ?? true,
                  controller: _changePwdCubit.oldPwdController,
                  placeholder: LocaleKeys.password_old.tr(),
                  borderRadius: 10,
                  prefix: const Padding(
                    padding: EdgeInsets.all(11.0),
                    child: CImage(
                      assetsPath: AppAssets.iconSignupLock,
                    ),
                  ),
                  suffix: GestureDetector(
                    onTap: () => _changePwdCubit
                        .emitShowOldPwd(!(state.isShowOldPwd ?? true)),
                    child: CImage(
                      assetsPath: state.isShowOldPwd == false
                          ? AppAssets.iconEyeShow
                          : AppAssets.iconEyeHidden,
                    ),
                  ),
                  onChanged: (value) {
                    _changePwdCubit.resetState();
                  },
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AppTextField(
                  obscureText: state.isShowNewPwd ?? true,
                  controller: _changePwdCubit.newPwdController,
                  placeholder: LocaleKeys.new_password.tr(),
                  borderRadius: 10,
                  prefix: const Padding(
                    padding: EdgeInsets.all(11.0),
                    child: CImage(
                      assetsPath: AppAssets.iconSignupLock,
                    ),
                  ),
                  suffix: GestureDetector(
                    onTap: () => _changePwdCubit
                        .emitShowNewPwd(!(state.isShowNewPwd ?? true)),
                    child: CImage(
                      assetsPath: state.isShowNewPwd == true
                          ? AppAssets.iconEyeShow
                          : AppAssets.iconEyeHidden,
                    ),
                  ),
                  onChanged: (value) {
                    _changePwdCubit.resetState();
                  },
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AppTextField(
                  obscureText: state.isShowConfirmPwd ?? true,
                  controller: _changePwdCubit.confirmController,
                  placeholder: LocaleKeys.confirm_password.tr(),
                  borderRadius: 10,
                  prefix: const Padding(
                    padding: EdgeInsets.all(11.0),
                    child: CImage(
                      assetsPath: AppAssets.iconSignupLock,
                    ),
                  ),
                  suffix: GestureDetector(
                    onTap: () => _changePwdCubit
                        .emitShowConfirmPwd(!(state.isShowConfirmPwd ?? true)),
                    child: CImage(
                      assetsPath: state.isShowConfirmPwd == false
                          ? AppAssets.iconEyeShow
                          : AppAssets.iconEyeHidden,
                    ),
                  ),
                  onChanged: (value) {
                    _changePwdCubit.resetState();
                  },
                ),
              ),
              const SizedBox(height: 12),
              CText(
                fontSize: 13,
                textColor: AppColors.colorEC222D,
                fontWeight: FontWeight.w400,
                lineSpacing: 1,
                text: state.msgChangePwd,
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 112),
                child: CButton(
                  height: 40,
                  width: double.infinity,
                  radius: 10,
                  backgroundColor: AppColors.colorFFCB08,
                  title: LocaleKeys.change_password_2.tr(),
                  titleFontWeight: FontWeight.w500,
                  onPressed: () {
                    _changePwdCubit.changePassword();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  _showDialogChangePwdSuccess(BuildContext context, {VoidCallback? onConfirm}) {
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
                const SizedBox(height: 54),
                const CImage(
                  assetsPath: AppAssets.iconCheckSuccess,
                  width: 60,
                  height: 60,
                ),
                const SizedBox(height: 30),
                CText(
                  textAlign: TextAlign.center,
                  lineSpacing: 1.2,
                  text: LocaleKeys.popup_change_password_success.tr(),
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
                    onPressed: onConfirm,
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
