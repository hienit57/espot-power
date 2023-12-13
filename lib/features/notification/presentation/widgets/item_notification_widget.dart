import 'package:espot_power/common/index.dart';
import 'package:espot_power/models/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/widgets.dart';

class ItemNotificationWidget extends StatelessWidget {
  final NotificationResponse? item;

  const ItemNotificationWidget({
    super.key,
    this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.colorF9F9FA,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Row(
          children: [
            if (item?.imageUrl?.isEmpty ?? false) ...[
              Container(
                  color: AppColors.colorFFCB05,
                  child: CImage(
                    assetsPath: AppAssets.iconMaker,
                    color: AppColors.color212121,
                  ))
            ] else ...[
              CImage(
                width: 72,
                height: 72,
                imageNetworkUrl: item?.imageUrl,
                boxFit: BoxFit.contain,
              )
            ],
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CText(
                    text: item?.title ?? '',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  CText(
                    text: item?.title ?? '',
                    fontSize: 12,
                    textColor: AppColors.color979797,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
