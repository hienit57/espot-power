import 'package:espot_power/common/index.dart';
import 'package:espot_power/common/widget/base_result_widget/result_page.dart';
import 'package:espot_power/core/routes/app_pages.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/models/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class VerifyAmountWithDrawPage extends StatelessWidget {
  final BankInformationResponse? bankInformationResponse;

  const VerifyAmountWithDrawPage({
    super.key,
    this.bankInformationResponse,
  });

  @override
  Widget build(BuildContext context) {
    final verifyAmountWithdrawCubit =
        BlocProvider.of<VerifyAmountWithdrawCubit>(context);

    return BaseWrapperWidget(
      isViewSupportProblem: true,
      onReturn: () => NavigatorExt.pop(AppContext.navigatorKey.currentContext!),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child:
            BlocConsumer<VerifyAmountWithdrawCubit, VerifyAmountWithdrawState>(
          buildWhen: (previous, current) =>
              previous.onVerifyAmountWithdraw != current.onVerifyAmountWithdraw,
          listenWhen: (previous, current) =>
              previous.onVerifyAmountWithdraw != current.onVerifyAmountWithdraw,
          listener: (context, state) {
            if (state.onVerifyAmountWithdraw == RequestStatus.success) {
              NavigatorExt.pushAndRemoveUntil(
                  AppContext.navigatorKey.currentContext!,
                  ResultPage(
                    title: LocaleKeys.order_placed_success.tr(),
                    icon: AppAssets.iconCheckOutSuccess,
                    customMessage: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: AppColors.colorText514D56,
                          fontWeight: FontWeight.w400,
                          wordSpacing: 1,
                          fontFamily: AppFonts.svnGotham,
                        ),
                        children: [
                          TextSpan(
                            text:
                                LocaleKeys.message_order_placed_success_1.tr(),
                          ),
                          TextSpan(
                            text: ' ${LocaleKeys.espot.tr()} ',
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          TextSpan(
                            text:
                                LocaleKeys.message_order_placed_success_2.tr(),
                          ),
                        ],
                      ),
                    ),
                    titleButtonOne: LocaleKeys.goback_home.tr(),
                    titleButtonTwo: LocaleKeys.check_transaction_history.tr(),
                    onTapButtonOne: () {
                      NavigatorExt.push(
                        AppContext.navigatorKey.currentContext!,
                        const HomePage(indexTab: 0),
                      );
                    },
                    onTapButtonTwo: () {
                      NavigatorExt.push(
                        AppContext.navigatorKey.currentContext!,
                        const HomePage(
                          indexTab: 1,
                          child: AllScreenHome.historyTransaction,
                        ),
                      );
                    },
                  ),
                  AppRoutes.verifyTransferMoney);
            } else if (state.onVerifyAmountWithdraw == RequestStatus.failure) {
              NavigatorExt.pushAndRemoveUntil(
                  AppContext.navigatorKey.currentContext!,
                  ResultPage(
                    title: LocaleKeys.order_placed_failed.tr(),
                    icon: AppAssets.iconCheckOutFailed,
                    customMessage: CText(
                      text: LocaleKeys.message_order_placed_failed.tr(),
                      textAlign: TextAlign.center,
                    ),
                    titleButtonOne: LocaleKeys.goback_home.tr(),
                    titleButtonTwo: LocaleKeys.check_transaction_history.tr(),
                    onTapButtonOne: () {
                      NavigatorExt.push(
                        AppContext.navigatorKey.currentContext!,
                        const HomePage(
                          indexTab: 0,
                          child: AllScreenHome.map,
                        ),
                      );
                    },
                    onTapButtonTwo: () {
                      NavigatorExt.push(
                        AppContext.navigatorKey.currentContext!,
                        const HomePage(
                          indexTab: 1,
                          child: AllScreenHome.historyTransaction,
                        ),
                      );
                    },
                  ),
                  AppRoutes.verifyAmountWithdaw);
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                const SizedBox(height: 24),
                Center(
                  child: CText(
                    text: LocaleKeys.confirm_withdraw.tr(),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 24),
                _buildInformationBankAccount(context),
                const SizedBox(height: 12),
                _buildNoteVerifyAmountWithdraw(),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 88),
                  child: CButton(
                    height: 40,
                    width: double.infinity,
                    radius: 10,
                    backgroundColor: AppColors.colorFFCB08,
                    title: LocaleKeys.confirm.tr(),
                    titleFontWeight: FontWeight.w500,
                    onPressed: () {
                      verifyAmountWithdrawCubit
                          .verifyAmountWithdraw(bankInformationResponse);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  _buildInformationBankAccount(BuildContext context) {
    return CContainer(
      width: double.infinity,
      backgroundColor: AppColors.colorEDEEF1,
      borderWidth: 0,
      radius: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CColumnTitleContentWidget(
              title: LocaleKeys.account_holder.tr(),
              content: bankInformationResponse?.ownerName,
            ),
            const SizedBox(height: 12),
            CColumnTitleContentWidget(
              title: LocaleKeys.account_number.tr(),
              content: bankInformationResponse?.account,
            ),
            const SizedBox(height: 12),
            CColumnTitleContentWidget(
              title: LocaleKeys.beneficiary_bank.tr(),
              content: bankInformationResponse?.bankName,
            ),
            const SizedBox(height: 12),
            CColumnTitleContentWidget(
              title: LocaleKeys.money.tr(),
              content: BlocProvider.of<VerifyAmountWithdrawCubit>(context)
                  .priceController
                  .text,
            ),
          ],
        ),
      ),
    );
  }

  _buildNoteVerifyAmountWithdraw() {
    return CContainer(
      width: double.infinity,
      radius: 10,
      backgroundColor: AppColors.color039BE5.withOpacity(0.1),
      borderWidth: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            style: TextStyle(
              color: AppColors.colorText231F20,
              fontFamily: AppFonts.svnGotham,
              fontWeight: FontWeight.w400,
            ),
            children: [
              TextSpan(
                text: LocaleKeys.note.tr(),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: LocaleKeys.note_confirm_withdraw.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
