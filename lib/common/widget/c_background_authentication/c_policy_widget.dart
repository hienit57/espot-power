import 'package:espot_power/common/index.dart';
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CText(
              textAlign: TextAlign.center,
              lineSpacing: 1.5,
              text: LocaleKeys.policy.tr(),
              textColor: AppColors.colorText231F20,
              textDecoration: TextDecoration.underline,
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (_) => CommonWebPage(
                //               url: UrlWebview.getPrivacy(),
                //               title: LocaleKeys.privacy_policy.tr(),
                //             )));
              },
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
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (_) => CommonWebPage(
                //               url: UrlWebview.getRules(),
                //               title: LocaleKeys.terms_use.tr(),
                //             )));
              },
            ),
          ],
        ),
        const SizedBox(height: 45),
      ],
    );
  }
}
