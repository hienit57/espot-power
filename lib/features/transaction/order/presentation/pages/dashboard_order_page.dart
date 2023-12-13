import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/widgets.dart';

class DashboardOrderPage extends StatefulWidget {
  const DashboardOrderPage({super.key});

  @override
  State<DashboardOrderPage> createState() => _DashboardOrderPageState();
}

class _DashboardOrderPageState extends State<DashboardOrderPage> {
  late DashboardOrderCubit orderCubit;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    orderCubit = BlocProvider.of<DashboardOrderCubit>(context);
    orderCubit.initData();

    _scrollController.addListener(_scrollListener);

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  void _loadMoreItems() {
    orderCubit.getOrders();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // You have reached the end of the list, load more items
      _loadMoreItems();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardOrderCubit, DashboardOrderState>(
      buildWhen: (previous, current) =>
          previous.onGetOrders != current.onGetOrders,
      builder: (context, state) {
        if (state.ordersReponseDisplay?.isEmpty ?? false) {
          return _buildEmptyOrders();
        } else if (state.ordersReponseDisplay?.isNotEmpty ?? false) {
          return Column(
            children: [
              _buildHistoryRentalBattery(),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  _buildHistoryRentalBattery() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocBuilder<DashboardOrderCubit, DashboardOrderState>(
          buildWhen: (previous, current) =>
              previous.onGetOrders != current.onGetOrders,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CountingTimeRentalBatteryWidget(),
                CText(
                  text: LocaleKeys.rental_history.tr(),
                  textAlign: TextAlign.center,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.zero,
                    itemCount: state.ordersReponseDisplay?.length ?? 0,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final item = state.ordersReponseDisplay?[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            orderCubit.emitOrderSelected(item);
                            BlocProvider.of<HomeCubit>(context)
                                .emitIndexTabSelect(1,
                                    screenForHome: AllScreenHome.detailOrder);
                          },
                          child: ItemOrderWidget(
                            orderResponse: item,
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  _buildEmptyOrders() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CImage(
          assetsPath: AppAssets.imgOrderBlank,
        ),
        const SizedBox(height: 24),
        CText(
          text: LocaleKeys.not_oder.tr(),
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 16),
        CText(
          text: LocaleKeys.history_content_order.tr(),
          textColor: AppColors.colorText514D56,
        ),
      ],
    );
  }
}
