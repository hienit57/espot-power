import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/features/transfer_money/presentation/pages/verify_transfer_money_page.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/app_colors.dart';
import 'package:espot_power/theme/app_fonts.dart';
import 'package:flutter/widgets.dart';

class TransferMoneyPage extends StatelessWidget {
  const TransferMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileCubit = BlocProvider.of<DashboardProfileCubit>(context);
    final transferMoneyCubit = BlocProvider.of<TransferMoneyCubit>(context);

    profileCubit.getUserProfile();
    transferMoneyCubit.initData();
    return BaseWrapperWidget(
      onReturn: () {
        NavigatorExt.pop(AppContext.navigatorKey.currentContext!);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocConsumer<TransferMoneyCubit, TransferMoneyState>(
          buildWhen: (previous, current) =>
              previous.onGetInformationReceiver !=
                  current.onGetInformationReceiver ||
              previous.msgGetInformationReceicer !=
                  current.msgGetInformationReceicer,
          listenWhen: (previous, current) =>
              previous.onGetInformationReceiver !=
              current.onGetInformationReceiver,
          listener: (context, state) {
            if (state.onGetInformationReceiver == RequestStatus.success) {
              NavigatorExt.push(AppContext.navigatorKey.currentContext!,
                  const VerifyTransferMoneyPage());
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
                CText(
                  text: LocaleKeys.main_account_balance.tr(),
                  fontSize: 13,
                  textColor: AppColors.colorText514D56,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 4),
                BlocConsumer<DashboardProfileCubit, DashboardProfileState>(
                  buildWhen: (previous, current) =>
                      previous.onGetUserProfile != current.onGetUserProfile,
                  listenWhen: (previous, current) =>
                      previous.onGetUserProfile != current.onGetUserProfile,
                  listener: (context, state) => transferMoneyCubit
                      .emitUserProfile(state.userProfileResponse),
                  builder: (context, state) {
                    return CText(
                      text: state.userProfileResponse?.getMoneyMainAccount,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.colorF9A825,
                    );
                  },
                ),
                const SizedBox(height: 24),
                CTitleTextField(
                  title: LocaleKeys.your_phone_receiver.tr(),
                  controller: transferMoneyCubit.phoneController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  onChanged: (p0) {
                    if (state.msgGetInformationReceicer != null) {
                      transferMoneyCubit.resetState();
                    }
                  },
                ),
                const SizedBox(height: 12),
                CTitleTextField(
                  title: LocaleKeys.amount_want_transfer.tr(),
                  controller: transferMoneyCubit.priceController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    CurrencyTextInputFormatter(locale: 'vi'),
                  ],
                  onChanged: (p0) {
                    if (state.msgGetInformationReceicer != null) {
                      transferMoneyCubit.resetState();
                    }
                  },
                ),
                const SizedBox(height: 44),
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
                      transferMoneyCubit.getInformationReceiver();
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
