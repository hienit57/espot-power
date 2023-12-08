import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class ViewFinanceWidget extends StatelessWidget {
  final UserProfileResponse? userProfileResponse;

  const ViewFinanceWidget({super.key, this.userProfileResponse});
  @override
  Widget build(BuildContext context) {
    return CContainer(
      backgroundColor: AppColors.bgcolorFFFAE6,
      radius: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _itemFinance(
                    title: LocaleKeys.main_account.tr().toUpperCase(),
                    content: userProfileResponse?.getMoneyMainAccount,
                  ),
                  Container(
                    color: AppColors.colorFFCB05,
                    width: 1,
                    height: 50,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: _itemFinance(
                  title: LocaleKeys.second_account.tr(),
                  content: userProfileResponse?.getMoneySecondAccount,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _itemFinance({String? content, String? title, VoidCallback? onTapTitle}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CText(
          text: content,
          fontSize: 16,
          textColor: AppColors.colorF9A825,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CText(
              text: title,
              fontSize: 12,
              textColor: AppColors.color979797,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: onTapTitle,
              child: const CImage(
                width: 16,
                height: 16,
                assetsPath: AppAssets.imgInfoCircle,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void onTapMainAccount() {
    ///TODO:FIX ME
    // cShowDialog(
    //   context,
    //   title: LocaleKeys.main_account.tr(),
    //   childChangeContent: RichText(
    //     textAlign: TextAlign.center,
    //     text: TextSpan(
    //       style: TextStyle(
    //         color: FontColor.colorText514D56,
    //         fontSize: FontSize.fontSize_14,
    //         fontFamily: Assets.svnGotham,
    //         fontWeight: FontWeight.w400,
    //       ),
    //       children: [
    //         TextSpan(
    //           text: LocaleKeys.content_popup_main_account_1
    //               .tr(),
    //         ),
    //         TextSpan(
    //           text: LocaleKeys.espot.tr(),
    //           style: const TextStyle(
    //               fontWeight: FontWeight.w500),
    //         ),
    //         TextSpan(
    //           text: LocaleKeys.content_popup_main_account_2
    //               .tr(),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  void onTapSecondAccount() {
    // cShowDialog(
    //   context,
    //   title: LocaleKeys.sub_account.tr(),
    //   childChangeContent: RichText(
    //     textAlign: TextAlign.center,
    //     text: TextSpan(
    //       style: TextStyle(
    //         color: FontColor.colorText514D56,
    //         fontSize: FontSize.fontSize_14,
    //         fontFamily: Assets.svnGotham,
    //         fontWeight: FontWeight.w400,
    //       ),
    //       children: [
    //         TextSpan(
    //           text: LocaleKeys.content_popup_account_second
    //               .tr(),
    //         ),
    //         TextSpan(
    //           text: LocaleKeys.espot.tr(),
    //           style: const TextStyle(
    //               fontWeight: FontWeight.w500),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}