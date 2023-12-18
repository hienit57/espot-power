import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/routes/app_pages.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:espot_power/utils/index.dart';
import 'package:flutter/material.dart';

class BalanceNotEnoughPage extends StatelessWidget {
  final bool? isRechargeBatteryRental;

  const BalanceNotEnoughPage({
    Key? key,
    this.isRechargeBatteryRental,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWrapperWidget(
      isViewSupportProblem: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 70),
            const CImage(
              assetsPath: AppAssets.iconCheckOutFailed,
              width: 120,
              height: 120,
            ),
            const SizedBox(height: 36),
            _buildMessageError(context),
            const SizedBox(height: 24),
            _btnCheckAndRecharge(),
            const SizedBox(height: 24),
            _buidlNoteBalanceNotEnough(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageError(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CText(
            text: LocaleKeys.balance_not_enough.tr(),
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 9),
        CText(
          text: LocaleKeys.content_balance_not_enough.tr(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 9),
        BlocBuilder<ConfirmForRentCubit, ConfirmForRentState>(
          bloc: BlocProvider.of<ConfirmForRentCubit>(context),
          builder: (context, state) {
            final calculateRemainingAmount = FormatUtils()
                .calculateRemainingAmount(
                    state.userProfileResponse?.money, 50000);

            final data =
                '${FormatUtils().formatNumberWithCommas(calculateRemainingAmount).toString()}đ';
            return CText(
              text: data,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
              textColor: AppColors.colorF9A825,
              fontSize: 40,
            );
          },
        ),
      ],
    );
  }

  Widget _btnCheckAndRecharge() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        children: [
          CContainer(
            height: 40,
            borderColor: AppColors.colorFFCB05,
            backgroundColor: AppColors.colorFFCB05,
            radius: 10,
            onTap: () {
              // cShowDialog(
              //   context,
              //   child: PopupPayment(
              //     missingAmount: widget.missingAmount,
              //     isRechargeBatteryRental: widget.isRechargeBatteryRental,
              //   ),
              // );
            },
            child: Center(
              child: CText(
                text: LocaleKeys.recharge_now.tr(),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 12),
          CContainer(
            height: 40,
            borderColor: AppColors.colorText231F20,
            radius: 10,
            onTap: () {
              NavigatorExt.pushAndRemoveUntil(
                  AppContext.navigatorKey.currentContext!,
                  const HomePage(indexTab: 0),
                  AppRoutes.balanceNotEnough);
            },
            child: Center(
              child: CText(
                text: LocaleKeys.goback_home.tr(),
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buidlNoteBalanceNotEnough() {
    return Column(
      children: [
        CContainer(
          backgroundColor: AppColors.colorFFF9E3,
          radius: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                  style: TextStyle(
                    fontFamily: AppFonts.svnGotham,
                    wordSpacing: 1.1,
                    fontSize: 14,
                    color: AppColors.colorText231F20,
                  ),
                  children: [
                    TextSpan(
                      text: LocaleKeys.note.tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.lerp(
                            FontWeight.w400, FontWeight.w500, 0.5),
                      ),
                    ),
                    TextSpan(
                      text: LocaleKeys.note_balance_not_enough_one.tr(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: '50,000đ',
                      style: TextStyle(
                        color: AppColors.colorEC222D,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: LocaleKeys.note_balance_not_enough_two.tr(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
