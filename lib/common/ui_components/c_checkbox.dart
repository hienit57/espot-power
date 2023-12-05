import 'package:bas_clean_architecture/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CCheckbox extends StatelessWidget {
  final double? width;
  final double? height;
  final double? sizeIcon;
  final Function(bool value)? onTap;
  final bool? isCheck;
  const CCheckbox({
    super.key,
    this.isCheck,
    this.width,
    this.height,
    this.onTap,
    this.sizeIcon,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          onTap?.call(isCheck ?? false);
        },
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: isCheck == true ? AppColors.brick : AppColors.white,
            shape: BoxShape.circle,
            border: Border.all(
              width: 1,
              color: AppColors.brick,
            ),
          ),
          child: Icon(
            Icons.check,
            color: AppColors.white,
            size: sizeIcon,
          ),
        ),
      ),
    );
  }
}
