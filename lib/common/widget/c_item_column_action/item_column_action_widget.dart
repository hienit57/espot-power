import 'package:bas_clean_architecture/common/index.dart';
import 'package:bas_clean_architecture/index.dart';
import 'package:bas_clean_architecture/theme/index.dart';
import 'package:flutter/material.dart';

class ItemColumnActionWidget extends StatelessWidget {
  final Color? bgColorIcon;
  final double? width;
  final double? sizedIcon;
  final double? sizedImage;
  final double? spaceWidth;
  final Function()? onTapButtonOne;
  final Function()? onTapButtonTwo;

  const ItemColumnActionWidget({
    super.key,
    this.bgColorIcon,
    this.width,
    this.onTapButtonOne,
    this.onTapButtonTwo,
    this.sizedIcon,
    this.sizedImage,
    this.spaceWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: onTapButtonOne,
            child: Container(
              width: sizedIcon ?? 37.h,
              height: sizedIcon ?? 37.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: bgColorIcon,
              ),
              child: Center(
                child: CImage(
                  assetsPath: AppAssets.icNote,
                  width: sizedImage ?? 14.w,
                  height: sizedImage ?? 16.h,
                  boxFit: BoxFit.contain,
                  color: AppColors.charcoal,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: spaceWidth ?? 6.w),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: onTapButtonTwo,
            child: Container(
              width: sizedIcon ?? 37.h,
              height: sizedIcon ?? 37.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: bgColorIcon,
              ),
              child: Center(
                child: CImage(
                  assetsPath: AppAssets.icTrash,
                  width: sizedImage ?? 14.w,
                  height: sizedImage ?? 16.h,
                  boxFit: BoxFit.contain,
                  color: AppColors.charcoal,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
