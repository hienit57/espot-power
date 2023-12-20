import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/widgets.dart';
import 'package:loading_indicator/loading_indicator.dart';

mixin LoadingMixin {
  showLoading() {
    EasyLoading.show(
      indicator: SizedBox(
        width: 20,
        height: 20,
        child: LoadingIndicator(
          indicatorType: Indicator.lineScalePulseOutRapid,
          colors: [
            AppColors.colorffFFCB08,
            AppColors.colorffFcec97,
            AppColors.colorffFFCB08,
            AppColors.colorffFcec97,
            AppColors.colorffFFCB08,
          ],
          pathBackgroundColor: AppColors.white,
        ),
      ),
    );
  }

  dismissloading() {
    EasyLoading.dismiss();
  }
}
