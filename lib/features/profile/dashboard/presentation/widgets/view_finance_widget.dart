import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/mixins/dialog_mixin.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class ViewFinanceWidget extends StatelessWidget with DialogMixin {
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
                    onTapExplain: () => onTapMainAccount(context),
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
                  title: LocaleKeys.sub_account.tr().toUpperCase(),
                  content: userProfileResponse?.getMoneySecondAccount,
                  onTapExplain: () => onTapSubAccount(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _itemFinance({String? content, String? title, VoidCallback? onTapExplain}) {
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
              onTap: onTapExplain,
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

  void onTapMainAccount(BuildContext context) {
    cShowGeneralDialog(
      context,
      widget: Align(
        alignment: Alignment.center,
        child: IntrinsicHeight(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 37),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CImage(
                  height: 164,
                  width: double.infinity,
                  assetsPath: AppAssets.imgOrderDialogInstructionPayBattery,
                  boxFit: BoxFit.fill,
                ),
                const SizedBox(height: 24),
                CText(
                  text: LocaleKeys.main_account.tr(),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        color: AppColors.colorText514D56,
                        fontSize: 14,
                        fontFamily: AppFonts.svnGotham,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: LocaleKeys.content_popup_main_account_1.tr(),
                        ),
                        TextSpan(
                          text: LocaleKeys.espot.tr(),
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          text: LocaleKeys.content_popup_main_account_2.tr(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 76),
                  child: CButton(
                    height: 40,
                    width: double.infinity,
                    radius: 10,
                    backgroundColor: AppColors.colorFFCB05,
                    borderColor: AppColors.colorFFCB05,
                    title: LocaleKeys.i_understand.tr(),
                    titleFontWeight: FontWeight.w500,
                    onPressed: () {
                      Navigator.pop(AppContext.navigatorKey.currentContext!);
                    },
                  ),
                ),
                const SizedBox(height: 36),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTapSubAccount(BuildContext context) {
    cShowGeneralDialog(
      context,
      widget: Align(
        alignment: Alignment.center,
        child: IntrinsicHeight(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 37),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CImage(
                  height: 164,
                  width: double.infinity,
                  assetsPath: AppAssets.imgOrderDialogInstructionPayBattery,
                  boxFit: BoxFit.fill,
                ),
                const SizedBox(height: 24),
                CText(
                  text: LocaleKeys.sub_account.tr(),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        color: AppColors.colorText514D56,
                        fontSize: 14,
                        fontFamily: AppFonts.svnGotham,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: LocaleKeys.content_popup_account_second.tr(),
                        ),
                        TextSpan(
                          text: LocaleKeys.espot.tr(),
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 76),
                  child: CButton(
                    height: 40,
                    width: double.infinity,
                    radius: 10,
                    backgroundColor: AppColors.colorFFCB05,
                    borderColor: AppColors.colorFFCB05,
                    title: LocaleKeys.i_understand.tr(),
                    titleFontWeight: FontWeight.w500,
                    onPressed: () {
                      Navigator.pop(AppContext.navigatorKey.currentContext!);
                    },
                  ),
                ),
                const SizedBox(height: 36),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
