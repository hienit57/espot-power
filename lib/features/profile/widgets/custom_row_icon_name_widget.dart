import 'package:espot_power/common/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class CustomRowIconNameWidget extends StatelessWidget {
  final String? icon;
  final String? name;
  final bool? isViewArrow;
  final Color? textColor;

  const CustomRowIconNameWidget({
    super.key,
    this.icon,
    this.name,
    this.isViewArrow = true,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CImage(assetsPath: icon, width: 16, height: 16, color: textColor),
            const SizedBox(width: 8),
            CText(
              text: name,
              textColor: textColor ?? AppColors.colorText514D56,
            ),
          ],
        ),
        if (isViewArrow == true) ...[
          const CImage(
            assetsPath: AppAssets.imgArrowRight,
            width: 16,
            height: 16,
          )
        ]
      ],
    );
  }
}
