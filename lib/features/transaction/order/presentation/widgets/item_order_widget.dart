import 'package:espot_power/common/index.dart';
import 'package:espot_power/models/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:espot_power/utils/index.dart';
import 'package:flutter/material.dart';

class ItemOrderWidget extends StatelessWidget {
  final OrderResponse? orderResponse;
  final VoidCallback? onTap;

  const ItemOrderWidget({
    Key? key,
    this.orderResponse,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.colorF9F9FA,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: CContainer(
                  width: 79,
                  height: 25,
                  radius: 10,
                  borderWidth: 0,
                  backgroundColor:
                      orderResponse!.getColorOrder.withOpacity(0.1),
                  child: Center(
                    child: CText(
                      text: orderResponse?.getTitleOrder ?? '',
                      textAlign: TextAlign.center,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      textColor: orderResponse!.getColorOrder,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Row(
                children: [
                  CImage(
                    assetsPath: orderResponse?.getImageOrder ?? '',
                    width: 72,
                    height: 72,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _rowIconContent(
                          icon: AppAssets.iconOrderCodeSmall,
                          content: orderResponse?.id.toString(),
                          contentColor: AppColors.color979797,
                        ),
                        const SizedBox(height: 2),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _rowIconContent(
                              icon: AppAssets.iconOrderCalendaSmall,
                              content: orderResponse?.getStartDateRental,
                              contentColor: AppColors.color979797,
                            ),
                            const SizedBox(width: 12),
                            _rowIconContent(
                              icon: AppAssets.iconOrderOclockSmall,
                              content: FormatUtils().convertTime(orderResponse
                                      ?.accountingMinutes
                                      ?.toDouble() ??
                                  0),
                              contentColor: AppColors.color979797,
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        _rowIconContent(
                          icon: AppAssets.iconOrderDolarSmall,
                          content: orderResponse?.getPriceOrder,
                          contentColor: AppColors.color039BE5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _rowIconContent({String? icon, String? content, Color? contentColor}) => Row(
        children: [
          CImage(
            assetsPath: icon,
            width: 16,
            height: 16,
          ),
          const SizedBox(width: 4),
          CText(
            text: content,
            textAlign: TextAlign.center,
            textColor: contentColor,
            fontWeight: FontWeight.w500,
          ),
        ],
      );
}
