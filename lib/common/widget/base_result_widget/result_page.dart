import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/mixins/dialog_mixin.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget with DialogMixin {
  final String? icon;
  final double? heightImage;
  final double? widthImage;
  final double? paddingTop;
  final bool? isHiddenProblem;

  final String? title;
  final bool? isReserveColorButton;
  final Widget? customMessage;

  final double? paddingButton;

  final String? titleButtonOne;
  final VoidCallback? onTapButtonOne;

  final String? titleButtonTwo;
  final VoidCallback? onTapButtonTwo;

  const ResultPage({
    super.key,
    this.icon,
    this.widthImage,
    this.heightImage,
    this.paddingTop,
    this.isHiddenProblem,
    this.title,
    this.isReserveColorButton,
    this.customMessage,
    this.paddingButton,
    this.onTapButtonOne,
    this.onTapButtonTwo,
    this.titleButtonOne,
    this.titleButtonTwo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseWrapperWidget(
        isViewSupportProblem: isHiddenProblem,
        child: Column(
          children: [
            SizedBox(height: paddingTop ?? 70),
            CImage(
              width: widthImage ?? 120,
              height: heightImage ?? 120,
              assetsPath: icon ?? AppAssets.iconCheckOutFailed,
              boxFit: BoxFit.contain,
            ),
            const SizedBox(height: 36),
            CText(
              text: title,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: customMessage ?? const SizedBox(),
            ),
            const SizedBox(height: 16),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 24 + (paddingButton ?? 0)),
              child: CButton(
                height: 40,
                width: double.infinity,
                radius: 10,
                title: titleButtonOne,
                titleFontWeight: FontWeight.w500,
                borderColor: isReserveColorButton == true
                    ? AppColors.colorText231F20.withOpacity(0.4)
                    : AppColors.colorFFCB08,
                backgroundColor: isReserveColorButton == true
                    ? AppColors.white
                    : AppColors.colorFFCB08,
                onPressed: onTapButtonOne,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 24 + (paddingButton ?? 0)),
              child: CButton(
                height: 40,
                width: double.infinity,
                radius: 10,
                title: titleButtonTwo,
                titleFontWeight: FontWeight.w500,
                borderColor: isReserveColorButton == true
                    ? AppColors.colorFFCB08
                    : AppColors.colorText231F20.withOpacity(0.4),
                backgroundColor: isReserveColorButton == true
                    ? AppColors.colorFFCB08
                    : AppColors.white,
                onPressed: onTapButtonTwo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
