import 'package:espot_power/common/index.dart';
import 'package:flutter/material.dart';

class CColumnTitleContentWidget extends StatelessWidget {
  final String? title;
  final double? fontSizeTitle;
  final FontWeight? fontWeightTitle;
  final Color? titleColor;

  final double? spaceHeight;

  final String? content;
  final double? fontSizeContent;
  final FontWeight? fontWeightContent;
  final Color? contentColor;

  const CColumnTitleContentWidget({
    super.key,
    this.title,
    this.content,
    this.fontSizeTitle,
    this.spaceHeight,
    this.fontSizeContent,
    this.fontWeightTitle,
    this.fontWeightContent,
    this.titleColor,
    this.contentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CText(
          text: title,
          fontSize: fontSizeTitle ?? 13,
          fontWeight: fontWeightTitle ?? FontWeight.w400,
          textColor: titleColor,
        ),
        SizedBox(height: spaceHeight ?? 0),
        CText(
          text: content,
          fontSize: fontSizeContent ?? 14,
          fontWeight: fontWeightContent ?? FontWeight.w500,
          textColor: contentColor,
        ),
      ],
    );
  }
}
