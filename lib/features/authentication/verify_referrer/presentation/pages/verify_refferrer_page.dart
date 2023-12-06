import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/mixins/dialog_mixin.dart';
import 'package:espot_power/features/authentication/password_settings/presentation/pages/password_settings_page.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class VerifyReferrerPage extends StatelessWidget with DialogMixin {
  final String? phoneNumber;
  final String? referrerNumber;

  const VerifyReferrerPage({
    super.key,
    this.phoneNumber,
    this.referrerNumber,
  });

  @override
  Widget build(BuildContext context) {
    return CBackgroundAuthWidget(
      child: Column(
        children: [
          CText(
            lineSpacing: 1.2,
            text: LocaleKeys.infor_refer.tr(),
            fontSize: 16,
            textColor: AppColors.colorText514D56,
          ),
          const SizedBox(height: 52),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: AppTextField(
              controller:
                  BlocProvider.of<VerifyReferrerCubit>(context).phoneController,
              placeholder: LocaleKeys.telephone_refer.tr(),
              borderRadius: 10,
              prefix: const Padding(
                padding: EdgeInsets.all(11.0),
                child: CImage(
                  assetsPath: AppAssets.iconSignupTelephone,
                ),
              ),
              onChanged: (value) {
                BlocProvider.of<VerifyReferrerCubit>(context)
                    .checkReferralUser();
              },
            ),
          ),
          const SizedBox(height: 38),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 112),
            child: BlocBuilder<VerifyReferrerCubit, VerifyReferrerState>(
              buildWhen: (previous, current) =>
                  previous.isCheckFormatPhone != current.isCheckFormatPhone,
              builder: (context, state) {
                return CButton(
                  height: 40,
                  width: double.infinity,
                  radius: 10,
                  backgroundColor: state.isCheckFormatPhone == true
                      ? AppColors.colorFFCB08
                      : AppColors.colorDADADA,
                  title: state.isCheckFormatPhone == true
                      ? LocaleKeys.continues.tr()
                      : LocaleKeys.skip.tr(),
                  titleFontWeight: FontWeight.w500,
                  onPressed: () {
                    final referrerNumber =
                        BlocProvider.of<VerifyReferrerCubit>(context)
                            .phoneController
                            .text;

                    NavigatorExt.push(
                        AppContext.navigatorKey.currentContext!,
                        PasswordSettingsPage(
                          phoneNumber: phoneNumber,
                          referrerNumber: state.isCheckFormatPhone == false
                              ? ''
                              : referrerNumber,
                        ));
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void errorReferrer(BuildContext context) {
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
                  assetsPath: AppAssets.iconSignupDialogCheckedError,
                  width: 72,
                  height: 72,
                ),
                const SizedBox(height: 24),
                CText(
                  textAlign: TextAlign.center,
                  lineSpacing: 1.2,
                  text: LocaleKeys.wrong_info_refferrer.tr(),
                  fontSize: 16,
                  textColor: AppColors.colorText514D56,
                ),
                const SizedBox(height: 34),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CButton(
                          height: 40,
                          radius: 10,
                          backgroundColor: AppColors.colorBorder,
                          borderColor: AppColors.colorBorder,
                          title: LocaleKeys.skip.tr(),
                          titleFontWeight: FontWeight.w500,
                          onPressed: () {
                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (_) => CreatePasswordPage(
                            //         phoneNumber:
                            //             widget.phoneNumber.toString(),
                            //       ),
                            //     ),
                            //     (route) => false);
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 1,
                        child: CButton(
                          height: 40,
                          radius: 10,
                          backgroundColor: AppColors.colorFFCB05,
                          borderColor: AppColors.colorFFCB05,
                          title: LocaleKeys.retype.tr(),
                          titleFontWeight: FontWeight.w500,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
