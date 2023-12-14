import 'package:espot_power/common/index.dart';
import 'package:espot_power/common/widget/base_result_widget/result_page.dart';
import 'package:espot_power/core/routes/app_pages.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/widgets.dart';

class VerifyTransferMoneyPage extends StatelessWidget {
  const VerifyTransferMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final transferMoneyCubit = BlocProvider.of<TransferMoneyCubit>(context);

    return BaseWrapperWidget(
      onReturn: () {
        NavigatorExt.pop(AppContext.navigatorKey.currentContext!);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocConsumer<TransferMoneyCubit, TransferMoneyState>(
          buildWhen: (previous, current) =>
              previous.onTransferMoney != current.onTransferMoney,
          listenWhen: (previous, current) =>
              previous.onTransferMoney != current.onTransferMoney,
          listener: (context, state) {
            if (state.onTransferMoney == RequestStatus.success) {
              NavigatorExt.pushAndRemoveUntil(
                  AppContext.navigatorKey.currentContext!,
                  ResultPage(
                    title: LocaleKeys.transfer_money_success.tr(),
                    icon: AppAssets.iconCheckOutSuccess,
                    customMessage: CText(
                      text: LocaleKeys.please_experence.tr(),
                      textAlign: TextAlign.center,
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
            } else if (state.onTransferMoney == RequestStatus.failure) {
              NavigatorExt.pushAndRemoveUntil(
                  AppContext.navigatorKey.currentContext!,
                  ResultPage(
                    title: LocaleKeys.transfer_money_failed.tr(),
                    icon: AppAssets.iconCheckOutFailed,
                    customMessage: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 56),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: AppColors.colorText514D56,
                            wordSpacing: 1,
                            fontFamily: AppFonts.svnGotham,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: LocaleKeys.message_transfer_money_failed_one
                                  .tr(),
                            ),
                            TextSpan(
                                text: ' ${LocaleKeys.espot.tr()} ',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700)),
                            TextSpan(
                              text: LocaleKeys.message_transfer_money_failed_two
                                  .tr(),
                            ),
                          ],
                        ),
                      ),
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
                  AppRoutes.verifyTransferMoney);
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Center(
                  child: CText(
                    text: LocaleKeys.transfer.tr(),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 24),
                CContainer(
                  radius: 10,
                  backgroundColor: AppColors.color039BE5.withOpacity(0.1),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ViewInformationUserWidget(
                      userProfileResponse: state.userProfileReceiver,
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                CText(
                  text: LocaleKeys.amount_want_transfer.tr(),
                  fontSize: 13,
                  textColor: AppColors.colorText514D56,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 4),
                CText(
                  text: transferMoneyCubit.priceController.text,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.color039BE5,
                ),
                const SizedBox(height: 28),
                CContainer(
                  width: double.infinity,
                  radius: 10,
                  backgroundColor: AppColors.color039BE5.withOpacity(0.1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: TextStyle(
                          color: AppColors.colorText231F20,
                          fontFamily: AppFonts.svnGotham,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: LocaleKeys.note.tr(),
                          ),
                          TextSpan(
                            text: LocaleKeys.note_transfer.tr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: CText(
                    fontSize: 13,
                    textColor: AppColors.colorEC222D,
                    fontWeight: FontWeight.w400,
                    lineSpacing: 1.3,
                    text: state.msgGetInformationReceicer,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 88),
                  child: CButton(
                    height: 40,
                    width: double.infinity,
                    radius: 10,
                    backgroundColor: AppColors.colorFFCB08,
                    title: LocaleKeys.continues.tr(),
                    titleFontWeight: FontWeight.w500,
                    onPressed: () {
                      transferMoneyCubit.transferMoney();
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
}
