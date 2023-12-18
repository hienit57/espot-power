import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/mixins/dialog_mixin.dart';
import 'package:espot_power/core/routes/app_pages.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class SystemProcessingPage extends StatelessWidget with DialogMixin {
  const SystemProcessingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      BlocProvider.of<ConfirmForRentCubit>(context).verifyPayBalance();
    });

    return BaseWrapperWidget(
      isViewSupportProblem: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocListener<ConfirmForRentCubit, ConfirmForRentState>(
          listenWhen: (previous, current) =>
              previous.onPayBalance != current.onPayBalance,
          listener: (context, state) {
            if (state.onPayBalance == RequestStatus.success) {
              NavigatorExt.pushAndRemoveUntil(
                context,
                ResultPage(
                  isReserveColorButton: true,
                  title: LocaleKeys.battery_rental_success.tr(),
                  icon: AppAssets.iconCheckOutSuccess,
                  customMessage: Padding(
                    padding: const EdgeInsets.only(bottom: 36),
                    child: CText(
                      text: LocaleKeys.receive_rechargeable_batteries.tr(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  paddingButton: 60,
                  titleButtonOne: LocaleKeys.goback_home.tr(),
                  titleButtonTwo: LocaleKeys.check_oder.tr(),
                  onTapButtonOne: () {
                    NavigatorExt.pushAndRemoveUntil(
                        AppContext.navigatorKey.currentContext!,
                        const HomePage(indexTab: 0),
                        AppRoutes.verifyTransferMoney);
                  },
                  onTapButtonTwo: () {
                    NavigatorExt.push(
                      AppContext.navigatorKey.currentContext!,
                      const HomePage(
                        indexTab: 1,
                        child: AllScreenHome.transaction,
                      ),
                    );
                  },
                ),
                AppRoutes.orderConfirmation,
              );
            }

            if (state.onPayBalance == RequestStatus.failure) {
              NavigatorExt.pushAndRemoveUntil(
                context,
                ResultPage(
                  isReserveColorButton: true,
                  title: LocaleKeys.battery_rental_failed.tr(),
                  icon: AppAssets.iconCheckOutFailed,
                  customMessage: Padding(
                    padding: const EdgeInsets.only(bottom: 36),
                    child: CText(
                      text: LocaleKeys.please_try_again_few_minutes.tr(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  paddingButton: 60,
                  titleButtonOne: LocaleKeys.goback_home.tr(),
                  titleButtonTwo: LocaleKeys.check_oder.tr(),
                  onTapButtonOne: () {
                    NavigatorExt.pushAndRemoveUntil(
                        AppContext.navigatorKey.currentContext!,
                        const HomePage(indexTab: 0),
                        AppRoutes.orderConfirmation);
                  },
                  onTapButtonTwo: () {
                    NavigatorExt.push(
                      AppContext.navigatorKey.currentContext!,
                      const HomePage(
                        indexTab: 1,
                        child: AllScreenHome.transaction,
                      ),
                    );
                  },
                ),
                AppRoutes.orderConfirmation,
              );
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 22),
              const SizedBox(
                height: 298,
                child: CImage(
                  assetsPath: AppAssets.imgCheckOnepayOrder,
                  boxFit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 47),
              CText(
                fontSize: 20,
                text: LocaleKeys.order_is_processing.tr(),
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: CText(
                  lineSpacing: 1.3,
                  textAlign: TextAlign.center,
                  text: LocaleKeys.wait_util_order_finish.tr(),
                  textColor: AppColors.colorText514D56,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
