import 'package:espot_power/common/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class ItemDetailInformationWidget extends StatelessWidget {
  final String? icon;
  final String? title;
  final String? content;

  const ItemDetailInformationWidget({
    super.key,
    this.icon,
    this.title,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CImage(
          assetsPath: icon,
          width: 32,
          height: 32,
          radius: 4,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CText(
              text: title,
              fontSize: 14,
            ),
            CText(
              text: content,
              fontSize: 11,
              textColor: AppColors.color979797,
            ),
          ],
        )
      ],
    );
  }
}
