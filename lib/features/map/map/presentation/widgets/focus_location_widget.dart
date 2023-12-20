import 'package:espot_power/common/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class FocusLocationWidget extends StatelessWidget {
  const FocusLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white,
      ),
      child: const Center(
        child: CImage(
          assetsPath: AppAssets.iconMapSentLocation,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
