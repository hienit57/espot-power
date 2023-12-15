import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/models/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class InputAmountWithdrawPage extends StatelessWidget {
  final BankInformationResponse? bankInformationResponse;

  const InputAmountWithdrawPage({
    super.key,
    this.bankInformationResponse,
  });

  @override
  Widget build(BuildContext context) {
    final profileCubit = BlocProvider.of<DashboardProfileCubit>(context);
    final verifyAmountWithdrawCubit =
        BlocProvider.of<VerifyAmountWithdrawCubit>(context);

    verifyAmountWithdrawCubit.initData();

    profileCubit.getUserProfile();
    return BaseWrapperWidget(
      isViewSupportProblem: true,
      onReturn: () => NavigatorExt.pop(AppContext.navigatorKey.currentContext!),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child:
            BlocBuilder<VerifyAmountWithdrawCubit, VerifyAmountWithdrawState>(
          buildWhen: (previous, current) =>
              previous.msgInputAmountWithdraw != current.msgInputAmountWithdraw,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Center(
                  child: CText(
                    text: LocaleKeys.widthdraw_money.tr(),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 24),
                _buildInformationBank(),
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
                  listener: (context, state) => verifyAmountWithdrawCubit
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
                  title: LocaleKeys.amount_withdraw.tr(),
                  controller: verifyAmountWithdrawCubit.priceController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [CurrencyTextInputFormatter(locale: 'vi')],
                  onChanged: (p0) {
                    if (state.msgInputAmountWithdraw != null) {
                      verifyAmountWithdrawCubit.resetState();
                    }
                  },
                ),
                const SizedBox(height: 12),
                _buildNoteWithdrawMoney(),
                const SizedBox(height: 12),
                Center(
                  child: CText(
                    fontSize: 13,
                    textColor: AppColors.colorEC222D,
                    fontWeight: FontWeight.w400,
                    lineSpacing: 1.3,
                    text: state.msgInputAmountWithdraw,
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
                      verifyAmountWithdrawCubit.checkAmountWithdraw(
                          bankInformationResponse: bankInformationResponse);
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

  _buildInformationBank() {
    return CContainer(
      width: double.infinity,
      borderColor: AppColors.colorEDEEF1,
      radius: 10,
      backgroundColor: AppColors.colorEDEEF1,
      borderWidth: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Row(
          children: [
            CContainer(
              width: 64,
              height: 64,
              borderColor: AppColors.colorDADADA,
              borderWidth: 1,
              radius: 10,
              child: CImage(
                imageNetworkUrl: bankInformationResponse?.bankImageUrl,
                boxFit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CText(
                    text: bankInformationResponse?.ownerName,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 2),
                  CText(
                    text: bankInformationResponse?.account,
                    fontSize: 13,
                  ),
                  const SizedBox(height: 2),
                  CText(
                    text: bankInformationResponse?.bankName,
                    fontSize: 13,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildNoteWithdrawMoney() {
    return CContainer(
      radius: 10,
      width: double.infinity,
      backgroundColor: AppColors.colorF1F1F1,
      borderWidth: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            const CImage(
              assetsPath: AppAssets.iconProblemBlack,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 8),
            CText(
              text: LocaleKeys.messenge_maximum_limit.tr(),
              fontSize: 13,
            ),
            CText(
              text: '500.000đ/lần',
              fontSize: 13,
              fontWeight:
                  FontWeight.lerp(FontWeight.w500, FontWeight.w400, 0.5),
            ),
          ],
        ),
      ),
    );
  }
}
