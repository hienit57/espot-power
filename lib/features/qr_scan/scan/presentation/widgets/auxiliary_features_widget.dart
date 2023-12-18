import 'package:espot_power/common/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class AuxiliaryFeatureWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String? icon;
  final String? title;

  const AuxiliaryFeatureWidget({
    super.key,
    this.onTap,
    this.icon,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return CContainer(
      height: 60,
      onTap: onTap,
      backgroundColor: AppColors.colorText231F20,
      radius: 10,
      child: Column(
        children: [
          const SizedBox(height: 6),
          CImage(
            assetsPath: icon,
            width: 24,
            height: 24,
          ),
          const SizedBox(height: 6),
          CText(
            text: title,
            fontSize: 13,
            textColor: AppColors.white,
          ),
        ],
      ),
    );
  }
}
