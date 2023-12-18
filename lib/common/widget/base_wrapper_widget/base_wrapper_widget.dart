import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/const.dart';
import 'package:espot_power/core/mixins/dialog_mixin.dart';
import 'package:espot_power/extensions/outside_service.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class BaseWrapperWidget extends StatelessWidget with DialogMixin {
  final VoidCallback? onReturn;
  final Widget? child;

  final bool? isViewSupportProblem;

  const BaseWrapperWidget({
    super.key,
    this.onReturn,
    this.child,
    this.isViewSupportProblem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const SizedBox(height: 58),
          if (onReturn != null) ...[
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onReturn,
                child: Row(
                  children: [
                    const CImage(
                      assetsPath: AppAssets.iconArrow,
                      width: 24,
                      height: 24,
                    ),
                    Container(width: 8),
                    CText(
                      textAlign: TextAlign.center,
                      lineSpacing: 1.2,
                      text: LocaleKeys.returns.tr(),
                    ),
                  ],
                ),
              ),
            ),
          ],
          Expanded(child: child ?? const SizedBox.shrink()),
          if (isViewSupportProblem == true) ...[
            GestureDetector(
              onTap: () => onTapProblem(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const CImage(
                    assetsPath: AppAssets.iconProblem,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 5),
                  CText(
                    text: LocaleKeys.your_problem.tr(),
                    textColor: AppColors.colorText514D56,
                    textDecoration: TextDecoration.underline,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 58)
          ]
        ],
      ),
    );
  }

  void onTapProblem(BuildContext context) {
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
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close, size: 24),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const CImage(
                  assetsPath: AppAssets.iconMapSupportDialogProblem,
                  width: 72,
                  height: 72,
                ),
                const SizedBox(height: 24),
                CText(
                  text: LocaleKeys.your_problem.tr(),
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: AppColors.colorText231F20,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.svnGotham,
                      ),
                      children: [
                        TextSpan(
                          text: LocaleKeys.suggest_line1_tile.tr(),
                        ),
                        TextSpan(
                          text: ' ${LocaleKeys.espot.tr()} ',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ]),
                ),
                const SizedBox(height: 8),
                CText(
                  text: LocaleKeys.suggest_line2_tile.tr(),
                ),
                const SizedBox(height: 36),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CButton(
                          height: 40,
                          backgroundColor: AppColors.white,
                          borderColor:
                              AppColors.colorText231F20.withOpacity(0.4),
                          radius: 10,
                          onPressed: () {
                            OutsideService().call(telephoneCompany);
                          },
                          title: LocaleKeys.call_phone_tile.tr(),
                          titleFontSize: 14,
                          titleColor: AppColors.colorText231F20,
                          titleFontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 7),
                      Expanded(
                        flex: 1,
                        child: CButton(
                          height: 40,
                          backgroundColor: AppColors.white,
                          borderColor:
                              AppColors.colorText231F20.withOpacity(0.4),
                          radius: 10,
                          onPressed: () {
                            OutsideService().sendMail(AppAssets.emailCompany);
                          },
                          title: LocaleKeys.send_email_tile.tr(),
                          titleFontSize: 14,
                          titleColor: AppColors.colorText231F20,
                          titleFontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
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
