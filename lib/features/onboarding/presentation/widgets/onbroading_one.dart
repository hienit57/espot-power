import 'package:espot_power/common/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class OnboardingOneWidget extends StatefulWidget {
  const OnboardingOneWidget({super.key});

  @override
  State<OnboardingOneWidget> createState() => _OnboardingOneWidgetState();
}

class _OnboardingOneWidgetState extends State<OnboardingOneWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 91),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 47),
            child: CImage(
              height: 90,
              assetsPath: AppAssets.imgLogoEspot,
            ),
          ),
          const SizedBox(height: 15),
          CText(
            text: LocaleKeys.hello.tr(),
            fontWeight: FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.5),
            fontSize: 20,
          ),
          const SizedBox(height: 19),
          const Center(
            child: CImage(
              height: 184,
              width: double.infinity,
              assetsPath: AppAssets.imgOnboardingOne,
            ),
          ),
          const SizedBox(height: 23),
          Center(
            child: CText(
              text: LocaleKeys.onbroading_one_chain_text_one.tr(),
              textAlign: TextAlign.justify,
              lineSpacing: 1.7,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: CText(
              text: LocaleKeys.onbroading_one_chain_text_two.tr(),
              textAlign: TextAlign.justify,
              lineSpacing: 1.7,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
