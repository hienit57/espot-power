import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/deposit_money/electronic_wallet/dashboard/data/enum/electronic_wallet.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/widgets.dart';

class DashboardElectronicWalletPage extends StatelessWidget {
  const DashboardElectronicWalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final electricWalletCubit = BlocProvider.of<ElectricWalletCubit>(context);
    return BaseWrapperWidget(
      onReturn: () {
        NavigatorExt.pop(AppContext.navigatorKey.currentContext!);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Center(
              child: CText(
                text: LocaleKeys.deposit_via_e_wallet.tr(),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 36),
            CText(
              text: LocaleKeys.form_payment.tr(),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 16),
            BlocBuilder<ElectricWalletCubit, ElectricWalletState>(
              buildWhen: (previous, current) =>
                  previous.electronicWalletSelected !=
                  current.electronicWalletSelected,
              builder: (context, state) {
                return Column(
                    children: ElectronicWallet.values
                        .map((element) => Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: CContainer(
                                width: double.infinity,
                                height: 52,
                                radius: 10,
                                onTap: () => electricWalletCubit
                                    .emitElectricWallet(element),
                                backgroundColor:
                                    state.electronicWalletSelected == element
                                        ? AppColors.colorFFCB08
                                        : AppColors.white,
                                borderColor:
                                    state.electronicWalletSelected == element
                                        ? AppColors.colorFFCB08
                                        : AppColors.colorDADADA,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CImage(
                                        width: 24,
                                        height: 24,
                                        assetsPath: element.icon,
                                      ),
                                      const SizedBox(width: 8),
                                      CText(
                                        text: element.title,
                                        fontWeight:
                                            state.electronicWalletSelected ==
                                                    element
                                                ? FontWeight.lerp(
                                                    FontWeight.w400,
                                                    FontWeight.w500,
                                                    0.5)
                                                : FontWeight.w400,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ))
                        .toList());
              },
            ),
            const SizedBox(height: 36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: CButton(
                height: 40,
                width: double.infinity,
                radius: 10,
                backgroundColor: AppColors.colorFFCB08,
                title: LocaleKeys.continues.tr(),
                titleFontWeight: FontWeight.w500,
                onPressed: () {
                  //dashboardDepositMoney.checkErrorDepositMoney();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
