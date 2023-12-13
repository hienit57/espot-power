import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/routes/navigator_ext.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CPolicyWidget extends StatelessWidget {
  const CPolicyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CText(
          textAlign: TextAlign.center,
          lineSpacing: 1.5,
          text: LocaleKeys.i_agree.tr(),
          textColor: AppColors.colorText514D56,
          fontStyle: FontStyle.normal,
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            const url = 'https://espot.vn/chinh-sach-bao-mat-thong-tin/';

            NavigatorExt.push(
              AppContext.navigatorKey.currentContext!,
              const CWebviewWidget(url: url),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CText(
                textAlign: TextAlign.center,
                lineSpacing: 1.5,
                text: LocaleKeys.policy.tr(),
                textColor: AppColors.colorText231F20,
                textDecoration: TextDecoration.underline,
              ),
              CText(
                lineSpacing: 1.5,
                text: LocaleKeys.and.tr(),
                textColor: AppColors.colorText514D56,
              ),
              CText(
                textAlign: TextAlign.center,
                lineSpacing: 1.5,
                text: LocaleKeys.rules.tr(),
                textColor: AppColors.colorText231F20,
                textDecoration: TextDecoration.underline,
              ),
            ],
          ),
        ),
        const SizedBox(height: 45),
      ],
    );
  }
}
