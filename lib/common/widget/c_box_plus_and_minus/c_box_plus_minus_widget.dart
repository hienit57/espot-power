import 'package:bas_clean_architecture/common/index.dart';
import 'package:bas_clean_architecture/index.dart';
import 'package:bas_clean_architecture/theme/index.dart';
import 'package:flutter/material.dart';

class CBoxPlusAndMinusWidget extends StatelessWidget {
  final VoidCallback? onPlus;
  final VoidCallback? onMinus;
  final String? content;
  const CBoxPlusAndMinusWidget({
    super.key,
    this.onPlus,
    this.onMinus,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border:
            Border.all(width: 1.w, color: AppColors.charcoal.withOpacity(0.2)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: CText(
                text: '-',
                fontSize: 23.sp,
                textColor: AppColors.charcoal.withOpacity(0.58),
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
                tappedText: () => onMinus?.call(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: CText(
                text: content ?? '0',
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: CText(
                text: '+',
                fontSize: 23.sp,
                textColor: AppColors.charcoal.withOpacity(0.58),
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
                tappedText: () => onPlus?.call(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
