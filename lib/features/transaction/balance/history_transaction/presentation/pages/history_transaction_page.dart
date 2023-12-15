import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class HistoryTransactionPage extends StatefulWidget {
  const HistoryTransactionPage({super.key});

  @override
  State<HistoryTransactionPage> createState() => _HistoryTransactionPageState();
}

class _HistoryTransactionPageState extends State<HistoryTransactionPage> {
  late HistoryTransactionCubit historyTransactionCubit;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    historyTransactionCubit = BlocProvider.of<HistoryTransactionCubit>(context);
    historyTransactionCubit.initData();

    _scrollController.addListener(_scrollListener);

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  void _loadMoreItems() {
    historyTransactionCubit.getHistoryTransactions();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // You have reached the end of the list, load more items
      _loadMoreItems();
    }
  }

  List<String> listTabHistoryTransaction = [
    LocaleKeys.main_account.tr(),
    LocaleKeys.sub_account.tr(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryTransactionCubit, HistoryTransactionState>(
      buildWhen: (previous, current) =>
          previous.onGetHistoryTransaction != current.onGetHistoryTransaction,
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 58),
            Center(
              child: CText(
                text: state.indexTab == 0
                    ? LocaleKeys.main_account.tr()
                    : LocaleKeys.sub_account.tr(),
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 24),
            _buildTabbar(context),
            const SizedBox(height: 24),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  child: (() {
                    if (state.transactionsReponseDisplay?.isNotEmpty ?? true) {
                      return ListView(
                          controller: _scrollController,
                          padding: EdgeInsets.zero,
                          children: (state.transactionsReponseDisplay ?? [])
                              .map(
                                (element) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: ItemTransactionWidget(
                                    transactionResponse: element,
                                  ),
                                ),
                              )
                              .toList());
                    }
                    return _buildEmptyTransaction();
                  }()),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  _buildTabbar(BuildContext context) {
    return BlocBuilder<HistoryTransactionCubit, HistoryTransactionState>(
      buildWhen: (previous, current) => previous.indexTab != current.indexTab,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SizedBox(
              height: 28,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        historyTransactionCubit.emitSelectTab(0);
                      },
                      child: Column(
                        children: [
                          CText(
                            text: LocaleKeys.main_account.tr(),
                            fontSize: 14,
                            textColor: state.indexTab == 0
                                ? AppColors.colorText231F20
                                : AppColors.color979797,
                          ),
                          const Spacer(),
                          Container(
                            height: 2,
                            color: state.indexTab == 0
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
                        historyTransactionCubit.emitSelectTab(1);
                      },
                      child: Column(
                        children: [
                          CText(
                            text: LocaleKeys.sub_account.tr(),
                            fontSize: 14,
                            textColor: state.indexTab == 1
                                ? AppColors.colorText231F20
                                : AppColors.color979797,
                          ),
                          const Spacer(),
                          Container(
                            height: 2,
                            color: state.indexTab == 1
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
              ),
        );
      },
    );
  }

  _buildEmptyTransaction() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CImage(
          assetsPath: AppAssets.imgOrderBlank,
        ),
        const SizedBox(height: 24),
        CText(
          text: LocaleKeys.not_transaction.tr(),
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 16),
        CText(
          text: LocaleKeys.history_content_transaction.tr(),
          textColor: AppColors.colorText514D56,
        ),
      ],
    );
  }
}
