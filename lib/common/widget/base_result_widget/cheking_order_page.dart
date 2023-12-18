import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/mixins/dialog_mixin.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class CheckingOrderPage extends StatelessWidget with DialogMixin {
  const CheckingOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWrapperWidget(
      isViewSupportProblem: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
              padding: EdgeInsets.symmetric(horizontal: 14),
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
    );
  }
}
