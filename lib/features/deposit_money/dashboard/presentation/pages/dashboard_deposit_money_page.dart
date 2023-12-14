import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/deposit_money/dashboard/data/enum/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/widgets.dart';

class DashboardDepositMoneyPage extends StatelessWidget {
  const DashboardDepositMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardDepositMoney =
        BlocProvider.of<DashboardDepositMoneyCubit>(context);
    dashboardDepositMoney.resetData();
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
                text: LocaleKeys.deposit_money.tr(),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 36),
            CText(
              text: LocaleKeys.money_want_recharge.tr(),
              fontSize: 16,
              fontWeight:
                  FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.5),
            ),
            const SizedBox(height: 16),
            BlocBuilder<DashboardDepositMoneyCubit, DashboardDepositMoneyState>(
              buildWhen: (previous, current) =>
                  previous.priceDepositMoney != current.priceDepositMoney,
              builder: (context, state) {
                return Wrap(
                  spacing: 12.0, // Khoảng cách giữa các item
                  runSpacing: 12.0, // Khoảng cách giữa các hàng
                  children: PriceDepositMoney.values.map(
                    (element) {
                      if (element == PriceDepositMoney.otherPrice) {
                        if (state.priceDepositMoney == element) {
                          return SizedBox(
                            height: 40,
                            width: (MediaQuery.of(context).size.width - 72) / 3,
                            child: AppTextField(
                              controller: dashboardDepositMoney.ortherPrice,
                              borderRadius: 10,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                              textAlign: TextAlign.center,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                            ),
                          );
                        }
                        return CContainer(
                          height: 40,
                          width: (MediaQuery.of(context).size.width - 72) / 3,
                          radius: 10,
                          backgroundColor: state.priceDepositMoney == element
                              ? AppColors.colorFFCB08
                              : AppColors.colorEDEEF1,
                          onTap: () {
                            BlocProvider.of<DashboardDepositMoneyCubit>(context)
                                .emitPriceDepositMoney(element);
                          },
                          child: Center(
                            child: CText(
                              text: element.title,
                              fontSize: 12,
                              fontWeight: state.priceDepositMoney == element
                                  ? FontWeight.w500
                                  : FontWeight.w400,
                            ),
                          ),
                        );
                      }

                      return CContainer(
                        height: 40,
                        width: (MediaQuery.of(context).size.width - 72) / 3,
                        radius: 10,
                        backgroundColor: state.priceDepositMoney == element
                            ? AppColors.colorFFCB08
                            : AppColors.colorEDEEF1,
                        onTap: () {
                          dashboardDepositMoney.emitPriceDepositMoney(element);
                        },
                        child: Center(
                          child: CText(
                            text: element.title,
                            fontSize: 12,
                            fontWeight: state.priceDepositMoney == element
                                ? FontWeight.w500
                                : FontWeight.w400,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                );
              },
            ),
            const SizedBox(height: 36),
            CText(
              text: LocaleKeys.form_payment.tr(),
              fontSize: 16,
              fontWeight:
                  FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.5),
            ),
            const SizedBox(height: 16),
            BlocBuilder<DashboardDepositMoneyCubit, DashboardDepositMoneyState>(
              buildWhen: (previous, current) =>
                  previous.typePayment != current.typePayment,
              builder: (context, state) {
                return Column(
                    children: TypePayments.values
                        .map((element) => Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: CContainer(
                                width: double.infinity,
                                height: 52,
                                radius: 10,
                                onTap: () => dashboardDepositMoney
                                    .emitTypePayment(element),
                                backgroundColor: state.typePayment == element
                                    ? AppColors.colorFFCB08
                                    : AppColors.white,
                                borderColor: state.typePayment == element
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
                                        assetsPath: element.getIconPayment,
                                      ),
                                      const SizedBox(width: 8),
                                      CText(
                                        text: element.getTitlePayment,
                                        fontWeight: state.typePayment == element
                                            ? FontWeight.lerp(FontWeight.w400,
                                                FontWeight.w500, 0.5)
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
            const SizedBox(height: 12),
            Center(
              child: BlocBuilder<DashboardDepositMoneyCubit,
                  DashboardDepositMoneyState>(
                buildWhen: (previous, current) =>
                    previous.msgSelectDepositMoney !=
                    current.msgSelectDepositMoney,
                builder: (context, state) {
                  return CText(
                    fontSize: 13,
                    textColor: AppColors.colorEC222D,
                    lineSpacing: 1.2,
                    text: state.msgSelectDepositMoney,
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
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
                  dashboardDepositMoney.checkErrorDepositMoney();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
