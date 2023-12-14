import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/mixins/dialog_mixin.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/widgets.dart';

class DashboardBalancePage extends StatelessWidget with DialogMixin {
  const DashboardBalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardBalanceCubit =
        BlocProvider.of<DashboardBalanceCubit>(context);
    dashboardBalanceCubit.getBalance();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: BlocBuilder<DashboardBalanceCubit, DashboardBalanceState>(
        builder: (context, state) {
          return Column(
            children: [
              _buildItemBalance(
                isMainBalance: true,
                price: state.userProfileResponse?.getMoneyMainAccount,
                onExplain: () => onTapMainAccount(context),
                titleButton2: LocaleKeys.transfer.tr(),
                onTapButton2: () => NavigatorExt.push(
                  AppContext.navigatorKey.currentContext!,
                  const TransferMoneyPage(),
                ),
                titleButton3: LocaleKeys.withdraw_money.tr(),
              ),
              const SizedBox(height: 12),
              _buildItemBalance(
                isMainBalance: false,
                price: state.userProfileResponse?.getMoneySecondAccount,
                onExplain: () => onTapSubAccount(context),
                titleButton2: LocaleKeys.enter_voucher_code.tr(),
                titleButton3: LocaleKeys.use_now.tr(),
                onTapButton3: () => BlocProvider.of<HomeCubit>(context)
                    .emitIndexTabSelect(0, screenForHome: AllScreenHome.map),
              ),
              const SizedBox(height: 12),
              _buildNoteBalance(),
              const SizedBox(height: 24),
              CButton(
                height: 36,
                width: double.infinity,
                radius: 10,
                backgroundColor: AppColors.white,
                borderColor: AppColors.colorText231F20.withOpacity(0.4),
                onPressed: () {
                  BlocProvider.of<HomeCubit>(context).emitIndexTabSelect(1,
                      screenForHome: AllScreenHome.historyTransaction);
                },
                title: LocaleKeys.check_transaction_history.tr(),
                titleFontSize: 13,
                titleFontWeight: FontWeight.w500,
              )
            ],
          );
        },
      ),
    );
  }

  _buildItemBalance({
    bool? isMainBalance,
    String? price,
    String? titleButton2,
    String? titleButton3,
    VoidCallback? onExplain,
    VoidCallback? onTapButton2,
    VoidCallback? onTapButton3,
  }) {
    return CContainer(
      backgroundColor: AppColors.colorFFFAE6,
      radius: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        child: Column(
          children: [
            GestureDetector(
              onTap: onExplain,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CText(
                    text: isMainBalance == true
                        ? LocaleKeys.main_account.tr().toUpperCase()
                        : LocaleKeys.sub_account.tr().toUpperCase(),
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                  const SizedBox(width: 8),
                  const CImage(
                    assetsPath: AppAssets.iconOrderProblemSmall,
                    width: 16,
                    height: 16,
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            CText(
              text: price,
              textColor: AppColors.colorF9A825,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (isMainBalance == true) ...[
                  Expanded(
                    flex: 1,
                    child: CButton(
                      height: 36,
                      radius: 10,
                      backgroundColor: AppColors.colorFFCB05,
                      borderColor: AppColors.colorFFCB05,
                      onPressed: () {
                        NavigatorExt.push(
                          AppContext.navigatorKey.currentContext!,
                          const DashboardDepositMoneyPage(),
                        );
                      },
                      title: LocaleKeys.deposit_money.tr(),
                      titleFontSize: 12.5,
                      titleFontWeight: FontWeight.w500,
                    ),
                  ),
                ],
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: CButton(
                    height: 36,
                    radius: 10,
                    backgroundColor: AppColors.white,
                    borderColor: AppColors.colorText231F20.withOpacity(0.4),
                    onPressed: onTapButton2,
                    title: titleButton2,
                    titleFontSize: 12.5,
                    titleFontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: CButton(
                    height: 36,
                    radius: 10,
                    backgroundColor: AppColors.white,
                    borderColor: AppColors.colorText231F20.withOpacity(0.4),
                    onPressed: onTapButton3,
                    title: titleButton3,
                    titleFontSize: 12.5,
                    titleFontWeight: FontWeight.w500,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildNoteBalance() {
    return CContainer(
      radius: 10,
      backgroundColor: AppColors.color039BE5.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            style: TextStyle(
              fontFamily: AppFonts.svnGotham,
              color: AppColors.colorText514D56,
              fontSize: 14,
              wordSpacing: 1.2,
              fontWeight: FontWeight.w400,
            ),
            children: [
              TextSpan(
                text: LocaleKeys.note.tr(),
                style: TextStyle(
                  fontWeight:
                      FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.5),
                ),
              ),
              TextSpan(
                text: LocaleKeys.note_surplus.tr(),
              )
            ],
          ),
        ),
      ),
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
