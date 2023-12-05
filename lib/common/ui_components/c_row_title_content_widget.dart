import 'package:bas_clean_architecture/common/index.dart';
import 'package:flutter/material.dart';
import 'package:bas_clean_architecture/index.dart';

class CRowTitleContentWidget extends StatelessWidget {
  final String? title;
  final double? fontSizeTitle;
  final FontWeight? fontWeightTitle;
  final Color? titleColor;
  final double? spaceWidth;
  final String? content;
  final double? fontSizeContent;
  final FontWeight? fontWeightContent;
  final Color? contentColor;

  const CRowTitleContentWidget({
    super.key,
    this.title,
    this.content,
    this.fontSizeTitle,
    this.spaceWidth,
    this.fontSizeContent,
    this.fontWeightTitle,
    this.fontWeightContent,
    this.titleColor,
    this.contentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CText(
          text: title,
          fontSize: fontSizeTitle ?? 18.sp,
          fontWeight: fontWeightTitle ?? FontWeight.bold,
          textColor: titleColor,
        ),
        SizedBox(width: spaceWidth ?? 15.w),
        CText(
          text: content,
          fontSize: fontSizeContent ?? 16.sp,
          fontWeight: fontWeightContent ?? FontWeight.w500,
          textColor: contentColor,
        ),
      ],
    );
  }
}
