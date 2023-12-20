import 'package:espot_power/common/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class EmptyLocationWidget extends StatelessWidget {
  final double? imageHeight;

  const EmptyLocationWidget({
    Key? key,
    this.imageHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CImage(
            assetsPath: AppAssets.imgSearchMapEmptySmall,
            height: imageHeight,
            boxFit: BoxFit.fitHeight,
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.colorText514D56,
                  wordSpacing: 1.82,
                  height: 1.2,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFonts.svnGotham,
                ),
                children: [
                  TextSpan(
                    text: LocaleKeys.sorryWithComa.tr(),
                  ),
                  TextSpan(
                      text: '${LocaleKeys.espot_power.tr()} ',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      )),
                  TextSpan(
                    text: LocaleKeys.search_store_empty.tr(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
