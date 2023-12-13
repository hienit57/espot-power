import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class InformationAndSupportCenterPage extends StatelessWidget {
  const InformationAndSupportCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWrapperWidget(
      onReturn: () {
        NavigatorExt.push(
            AppContext.navigatorKey.currentContext!,
            const HomePage(
              indexTab: 4,
              child: AllScreenHome.profile,
            ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Center(
            child: CText(
              text: LocaleKeys.support_center.tr(),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: CText(
              text: LocaleKeys.information.tr(),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          ...listFeatureSupportInformation.map(
            (element) => _itemFeatureSupport(
              name: element.name,
              url: element.url,
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: CText(
              text: LocaleKeys.support.tr(),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          ...listFeatureSupport.map(
            (element) => _itemFeatureSupport(
              name: element.name,
              url: element.url,
            ),
          ),
          _buildInformationVersion(name: 'Phiên bản 1.0.0')
        ],
      ),
    );
  }

  _itemFeatureSupport({String? name, String? url}) {
    return GestureDetector(
      onTap: () {
        NavigatorExt.push(
          AppContext.navigatorKey.currentContext!,
          SupportWebviewPage(
            url: url,
          ),
        );
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CText(
                  text: name,
                  textColor: AppColors.colorText514D56,
                ),
                const CImage(
                  assetsPath: AppAssets.imgArrowRight,
                  width: 16,
                  height: 16,
                )
              ],
            ),
          ),
          Container(height: 1, color: AppColors.colorF1F1F1),
        ],
      ),
    );
  }

  _buildInformationVersion({String? name}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: CText(
            text: name,
            textColor: AppColors.color979797,
          ),
        ),
        Container(height: 1, color: AppColors.colorF1F1F1),
      ],
    );
  }
}
