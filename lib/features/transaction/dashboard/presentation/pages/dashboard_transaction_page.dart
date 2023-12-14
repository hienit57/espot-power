import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class DashboardTransactionPage extends StatefulWidget {
  const DashboardTransactionPage({super.key});

  static List<String> listTabTransaction = [
    LocaleKeys.order.tr(),
    LocaleKeys.your_balance.tr(),
  ];

  @override
  State<DashboardTransactionPage> createState() =>
      _DashboardTransactionPageState();
}

class _DashboardTransactionPageState extends State<DashboardTransactionPage> {
  late DashboardTransactionCubit userManualCubit;

  @override
  void initState() {
    userManualCubit = BlocProvider.of<DashboardTransactionCubit>(context);
    userManualCubit.emitSelectTab(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardTransactionCubit, DashboardTransactionState>(
      buildWhen: (previous, current) =>
          previous.indexTabbar != current.indexTabbar,
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 58),
            Center(
              child: CText(
                text: state.indexTabbar == 0
                    ? LocaleKeys.your_order.tr()
                    : LocaleKeys.surplus_of_me.tr(),
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: _buildTabbar(context),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SizedBox(
                child: (() {
                  switch (state.indexTabbar) {
                    case 0:
                      return const DashboardBalancePage();

                    case 1:
                      return const DashboardOrderPage();
                  }
                }()),
              ),
            ),
          ],
        );
      },
    );
  }

  _buildTabbar(BuildContext context) {
    BlocProvider.of<DashboardTransactionCubit>(context);

    return BlocBuilder<DashboardTransactionCubit, DashboardTransactionState>(
      buildWhen: (previous, current) =>
          previous.indexTabbar != current.indexTabbar,
      builder: (context, state) {
        return SizedBox(
            height: 28,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      BlocProvider.of<DashboardTransactionCubit>(context)
                          .emitSelectTab(0);
                    },
                    child: Column(
                      children: [
                        CText(
                          text: LocaleKeys.surplus_account.tr(),
                          fontSize: 14,
                          textColor: state.indexTabbar == 0
                              ? AppColors.colorText231F20
                              : AppColors.color979797,
                        ),
                        const Spacer(),
                        Container(
                          height: 2,
                          color: state.indexTabbar == 0
                              ? AppColors.colorFFCB08
                              : AppColors.white,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      BlocProvider.of<DashboardTransactionCubit>(context)
                          .emitSelectTab(1);
                    },
                    child: Column(
                      children: [
                        CText(
                          text: LocaleKeys.order.tr(),
                          fontSize: 14,
                          textColor: state.indexTabbar == 1
                              ? AppColors.colorText231F20
                              : AppColors.color979797,
                        ),
                        const Spacer(),
                        Container(
                          height: 2,
                          color: state.indexTabbar == 1
                              ? AppColors.colorFFCB08
                              : AppColors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )

            // Expanded(
            //   child: ListView.builder(
            //     itemCount: listTabTransaction.length,
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: (context, index) {
            //       final item = listTabTransaction[index];
            //       return MouseRegion(
            //         cursor: SystemMouseCursors.click,
            //         child: GestureDetector(
            //           behavior: HitTestBehavior.opaque,
            //           onTap: () {
            //             userManualCubit.emitSelectTab(index);
            //             userManualCubit.getUserManual();
            //           },
            //           child: Column(
            //             children: [
            //               CText(
            //                 text: item,
            //                 fontSize: 14,
            //                 textColor: state.indexSelectTab == index
            //                     ? AppColors.colorText231F20
            //                     : AppColors.color979797,
            //               ),
            //               const Spacer(),
            //               Container(
            //                 height: 2,
            //                 color: state.indexSelectTab == index
            //                     ? AppColors.colorFFCB08
            //                     : AppColors.white,
            //               )
            //             ],
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            );
      },
    );
  }
}
