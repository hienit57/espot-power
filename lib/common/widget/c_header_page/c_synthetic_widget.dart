import 'package:bas_clean_architecture/common/ui_components/index.dart';
import 'package:bas_clean_architecture/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:bas_clean_architecture/index.dart';

class SyntheticWidget extends StatelessWidget {
  final String? title;
  final String? content;
  final String? date;
  final CrossAxisAlignment? crossAxisAlignment;

  const SyntheticWidget({
    super.key,
    this.title,
    this.content,
    this.date,
    this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return CContainer(
      width: (MediaQuery.of(context).size.width - 440 - 60.w) / 3,
      height: 154.h,
      borderWidth: 1,
      radius: 10,
      borderColor: AppColors.charcoal.withOpacity(0.3),
      child: Padding(
        padding: EdgeInsets.fromLTRB(19.w, 15.h, 12.w, 15.h),
        child: Column(
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CText(
                  text: title,
                  textColor: AppColors.charcoal.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                ),
                Icon(
                  Icons.more_vert,
                  color: AppColors.charcoal,
                  size: 15.h,
                )
              ],
            ),
            CText(
              text: content,
              textColor: AppColors.brick,
              fontWeight: FontWeight.bold,
              fontSize: 36.h,
            ),
            CText(
              text: date,
              textColor: AppColors.charcoal.withOpacity(0.6),
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
