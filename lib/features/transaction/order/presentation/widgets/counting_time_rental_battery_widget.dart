import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/mixins/dialog_mixin.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/widgets.dart';

class CountingTimeRentalBatteryWidget extends StatelessWidget with DialogMixin {
  const CountingTimeRentalBatteryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CText(
            text: '04:25:45',
            fontSize: 36,
            textColor: AppColors.colorText514D56,
          ),
        ),
        const SizedBox(height: 24),
        _buildInforBattery(context),
        const SizedBox(height: 24),
        _buildFinanceOrder(context),
        const SizedBox(height: 24),
      ],
    );
  }

  _buildInforBattery(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CImage(
              assetsPath: AppAssets.iconOrderCheckSmall,
              color: AppColors.color34A853,
              width: 16,
              height: 16,
            ),
            const SizedBox(width: 4),
            CText(
              text: LocaleKeys.rentaling_battery.tr(),
              textAlign: TextAlign.center,
              textColor: AppColors.color34A853,
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const CImage(
              width: 16,
              height: 16,
              assetsPath: AppAssets.iconOrderCodeSmall,
            ),
            const SizedBox(width: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CText(
                  text: '${LocaleKeys.rentaling_battery.tr()}: ',
                  textAlign: TextAlign.center,
                  textColor: AppColors.color979797,
                ),
                CText(
                  text: '1234567',
                  textAlign: TextAlign.center,
                  textColor: AppColors.colorText231F20,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () => onTapExplainPayBattery(context),
          child: Row(
            children: [
              CImage(
                width: 16,
                height: 16,
                assetsPath: AppAssets.iconOrderRefreshSmall,
                color: AppColors.color039BE5,
              ),
              const SizedBox(width: 4),
              CText(
                text: LocaleKeys.want_pay_battery.tr(),
                textAlign: TextAlign.center,
                textColor: AppColors.color039BE5,
                textDecoration: TextDecoration.underline,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildFinanceOrder(BuildContext context) {
    return CContainer(
      backgroundColor: AppColors.white,
      borderColor: AppColors.colorDADADA,
      radius: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _itemFinance(
                    title: LocaleKeys.deposit.tr().toUpperCase(),
                    content: '100.000d',
                    contentColor: AppColors.colorF9A825,
                    onTapExplain: () => onTapExplainDeposit(context),
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
                padding: const EdgeInsets.only(left: 10),
                child: _itemFinance(
                  title: LocaleKeys.used.tr().toUpperCase(),
                  content: '100.000d',
                  contentColor: AppColors.color039BE5,
                  onTapExplain: () => onTapExplainMoneyUsed(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _itemFinance(
      {String? content,
      Color? contentColor,
      String? title,
      VoidCallback? onTapExplain}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CText(
          text: content,
          fontSize: 16,
          textColor: contentColor,
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
              textOverflow: TextOverflow.ellipsis,
            ),
            const SizedBox(width: 7),
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

  void onTapExplainDeposit(BuildContext context) {
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
                  text: LocaleKeys.battery_deposit.tr(),
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
                          text: LocaleKeys.note_battery_deposit_one.tr(),
                        ),
                        TextSpan(
                          text: LocaleKeys.espot.tr(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: LocaleKeys.note_battery_deposit_two.tr(),
                        ),
                        TextSpan(
                          text: LocaleKeys.espot.tr(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: LocaleKeys.note_battery_deposit_three.tr(),
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

  void onTapExplainMoneyUsed(BuildContext context) {
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
                  text: LocaleKeys.service_charge.tr(),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CText(
                    text: LocaleKeys.message_service_usage.tr(),
                    textAlign: TextAlign.center,
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

  void onTapExplainPayBattery(BuildContext context) {
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
                  text: LocaleKeys.pay_battery_charge.tr(),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
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
                            text: LocaleKeys.popup_pay_battery_charge.tr(),
                          ),
                          TextSpan(
                            text: LocaleKeys.espot.tr(),
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ]),
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
