import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/models/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/widgets.dart';

class DetailOrderPage extends StatelessWidget {
  const DetailOrderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

    BlocProvider.of<DashboardOrderCubit>(context);

    return BaseWrapperWidget(
      onReturn: () {
        BlocProvider.of<HomeCubit>(context)
            .emitIndexTabSelect(1, screenForHome: AllScreenHome.transaction);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocBuilder<DashboardOrderCubit, DashboardOrderState>(
          buildWhen: (previous, current) =>
              previous.orderSelected != current.orderSelected,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Center(
                  child: CText(
                    text: state.orderSelected?.statusGroup == 'Underway'
                        ? LocaleKeys.place_rental_battery.tr()
                        : LocaleKeys.detail_order.tr(),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 17),
                CText(
                  text: LocaleKeys.battery_rental_return_location.tr(),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 9),
                _buildLocation(maxWidth, orderSelected: state.orderSelected),
                const SizedBox(height: 10),
                _buildDetailInformation(orderSelected: state.orderSelected),
              ],
            );
          },
        ),
      ),
    );
  }

  _buildLocation(double maxWidth, {OrderResponse? orderSelected}) {
    if (orderSelected?.statusGroup == 'Underway') {
      return Row(
        children: [
          CImage(
            radius: 10,
            width: 88,
            height: 88,
            imageNetworkUrl: orderSelected?.shopAvatarUrl,
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 0.6 * maxWidth,
                    child: CText(
                      text: orderSelected?.shopName,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      lineSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    width: 0.6 * maxWidth,
                    child: CText(
                      text: orderSelected?.shopAddr,
                      lineSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.color34A853,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: CText(
                          text:
                              '${orderSelected?.timeStartTime ?? '00:00'} - ${orderSelected?.timeEndTime ?? '00:00'}',
                          textColor: AppColors.color34A853,
                          fontSize: 11,
                          fontWeight: FontWeight.lerp(
                            FontWeight.w400,
                            FontWeight.w500,
                            0.5,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      );
    }
    return CContainer(
      width: double.infinity,
      radius: 10,
      backgroundColor: AppColors.colorF9F9FA,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 11),
              child: Row(
                children: [
                  CImage(
                    radius: 10,
                    width: 35,
                    height: 35,
                    imageNetworkUrl: orderSelected?.shopAvatarUrl,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CText(
                          text: orderSelected?.shopName ?? '',
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(height: 3),
                        SizedBox(
                          width: 0.7 * maxWidth,
                          child: CText(
                            text: orderSelected?.shopAddr ?? '',
                            fontSize: 11,
                            textColor: AppColors.color979797,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 27, right: 23),
                child: CImage(
                  assetsPath: AppAssets.imgOrderDetailItemPath,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CText(
                        text: orderSelected?.shopNameBack ?? '',
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(height: 3),
                      SizedBox(
                        width: 0.7 * maxWidth,
                        child: CText(
                          text: orderSelected?.displayAddrBack ?? '',
                          fontSize: 11,
                          textColor: AppColors.color979797,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 9),
                  CImage(
                    radius: 10,
                    width: 35,
                    height: 35,
                    imageNetworkUrl: orderSelected?.shopBackAvatarUrl,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildDetailInformation({OrderResponse? orderSelected}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CText(
          text: LocaleKeys.details_order.tr(),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 9),
        _buidlItemDetailInformation(
          icon: AppAssets.imgOrderDetailItemCode,
          title: orderSelected?.id.toString(),
          content: LocaleKeys.your_order_number.tr(),
        ),
        const SizedBox(height: 12),
        _buidlItemDetailInformation(
          icon: AppAssets.imgOrderDetailItemServiceUsageFee,
          title: orderSelected?.getServiceUsageFee,
          content: LocaleKeys.service_usage_fee.tr(),
        ),
        const SizedBox(height: 12),
        _buidlItemDetailInformation(
          icon: AppAssets.imgOrderDetailItemUsageService,
          title: orderSelected?.caculatorTimeUserService,
          content: LocaleKeys.service_time.tr(),
        ),
        const SizedBox(height: 12),
        _buidlItemDetailInformation(
          icon: AppAssets.imgOrderDetailItemTimeRentRechargeable,
          title: orderSelected?.getDateTimeRental ?? '',
          content: LocaleKeys.time_to_rent_rechargeable_batteries.tr(),
        ),
        if (orderSelected?.statusGroup != 'Underway') ...[
          const SizedBox(height: 12),
          _buidlItemDetailInformation(
            icon: AppAssets.imgOrderDetailItemTimePayRechargeable,
            title: orderSelected?.getDateTimePay ?? '',
            content: LocaleKeys.time_to_return_rechargeable_batteries.tr(),
          ),
        ]
      ],
    );
  }

  _buidlItemDetailInformation({
    String? icon,
    String? title,
    String? content,
  }) {
    return Row(
      children: [
        CImage(
          assetsPath: icon,
          width: 32,
          height: 32,
          radius: 4,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CText(
              text: title,
              fontSize: 14,
            ),
            CText(
              text: content,
              fontSize: 11,
              textColor: AppColors.color979797,
            ),
          ],
        )
      ],
    );
  }
}
