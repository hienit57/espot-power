import 'package:bas_clean_architecture/common/index.dart';
import 'package:bas_clean_architecture/index.dart';
import 'package:bas_clean_architecture/theme/index.dart';
import 'package:flutter/material.dart';

class CBoxFilterWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final String? icon;
  final String? selectTitle;
  final VoidCallback? onTapFilter;

  const CBoxFilterWidget({
    super.key,
    this.height,
    this.width,
    this.icon,
    this.selectTitle,
    this.onTapFilter,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTapFilter,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: AppColors.charcoal.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 11.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CImage(
                      assetsPath: icon,
                      height: 16.h,
                      width: 19.w,
                    ),
                    SizedBox(width: 9.w),
                    CText(
                      text: selectTitle,
                      textColor: AppColors.charcoal,
                      fontSize: 14.sp,
                      textOverflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
                CImage(
                  width: 12.w,
                  height: 6.6.h,
                  assetsPath: AppAssets.icArrowDown,
                  color: AppColors.charcoal.withOpacity(0.4),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
