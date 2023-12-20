import 'package:espot_power/common/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/models/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:espot_power/utils/index.dart';
import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final LocationResponse? informationLocation;

  const LocationWidget({
    super.key,
    this.informationLocation,
  });

  @override
  Widget build(BuildContext context) {
    Future<String>? getDistance() => FormatUtils().calculateDistance(
        double.parse(informationLocation?.lat ?? '0'),
        double.parse(informationLocation?.lng ?? '0'));

    return Column(
      children: [
        Row(
          children: [
            if (informationLocation?.shopImageUrl == 'undefined') ...[
              const CImage(
                radius: 10,
                width: 94,
                height: 88,
                assetsPath: AppAssets.imgInstructionPayBattery,
              ),
            ] else ...[
              CImage(
                radius: 10,
                width: 88,
                height: 88,
                imageNetworkUrl: informationLocation?.shopImageUrl,
              ),
            ],
            Expanded(
              child: SizedBox(
                height: 88,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CText(
                        text: informationLocation?.shopName ?? '',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        lineSpacing: 1,
                      ),
                      const SizedBox(height: 4),
                      CText(
                        text: informationLocation?.displayAddr ?? '',
                        textOverflow: TextOverflow.ellipsis,
                        maxLine: 3,
                        lineSpacing: 1,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 3),
                            child: CImage(
                              assetsPath: AppAssets.iconItemCompass,
                              width: 14,
                              height: 14,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: CText(
                              text: LocaleKeys.distance.tr(),
                              textColor: AppColors.colorText514D56,
                            ),
                          ),
                          FutureBuilder<String>(
                            future: getDistance(),
                            builder: (context, snapshot) {
                              return CText(
                                text: snapshot.data,
                                textColor: AppColors.colorText514D56,
                                fontWeight: FontWeight.w500,
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildStatus(
              icon: AppAssets.iconDot,
              iconColor: AppColors.color34A853,
              content: '08:00 - 18:00',
              contentFontSize: 11,
              contentFontWeight: FontWeight.w500,
              contentColor: AppColors.color34A853,
            ),
            const SizedBox(width: 10),
            _buildStatus(
              icon: AppAssets.iconCheckOutSuccess,
              iconColor: AppColors.color34A853,
              content: '08:00 - 18:00',
              contentFontSize: 12,
            ),
            const SizedBox(width: 24),
            _buildStatus(
              icon: AppAssets.iconCheckOutSuccess,
              iconColor: AppColors.color34A853,
              content: '08:00 - 18:00',
              contentFontSize: 12,
            ),
          ],
        )
      ],
    );
  }

  _buildStatus({
    String? icon,
    Color? iconColor,
    String? content,
    FontWeight? contentFontWeight,
    Color? contentColor,
    double? contentFontSize,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CImage(
          assetsPath: icon,
          width: 14,
          height: 14,
          color: iconColor,
        ),
        const SizedBox(width: 4),
        CText(
          text: content,
          fontSize: contentFontSize,
          fontWeight: contentFontWeight,
          textColor: contentColor,
        )
      ],
    );
  }
}
