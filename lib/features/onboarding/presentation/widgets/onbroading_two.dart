import 'package:espot_power/common/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class OnboardingTwoWidget extends StatefulWidget {
  const OnboardingTwoWidget({super.key});

  @override
  State<OnboardingTwoWidget> createState() => _OnboardingTwoWidgetState();
}

class _OnboardingTwoWidgetState extends State<OnboardingTwoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
          Center(
            child: CText(
              text: LocaleKeys.user_manual.tr(),
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 36),
          Row(
            children: [
              const Expanded(
                flex: 2,
                child: CImage(
                  assetsPath: AppAssets.imgOnboardingTwoStepOne,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CText(
                      text: '${LocaleKeys.step.tr()} 1',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    const SizedBox(height: 16),
                    RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.colorText231F20,
                          wordSpacing: 1.82,
                          height: 1.4,
                          fontFamily: AppFonts.svnGotham,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${LocaleKeys.open_app.tr()} ',
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: '${LocaleKeys.espot.tr()} ',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: LocaleKeys.onbroading_two_chain_text_step_one
                                .tr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: '${LocaleKeys.espot.tr()} ',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 36),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CText(
                      text: '${LocaleKeys.step.tr()} 2',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    const SizedBox(height: 16),
                    RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.colorText231F20,
                          fontFamily: AppFonts.svnGotham,
                          height: 1.4,
                          wordSpacing: 1.82,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: LocaleKeys.onbroading_two_chain_text_step_two
                                .tr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 20),
              const Expanded(
                flex: 2,
                child: CImage(
                  assetsPath: AppAssets.imgOnboardingTwoStepTwo,
                ),
              ),
            ],
          ),
          const SizedBox(height: 36),
          Row(
            children: [
              const Expanded(
                flex: 2,
                child: CImage(
                  assetsPath: AppAssets.imgOnboardingTwoStepThree,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CText(
                      text: '${LocaleKeys.step.tr()} 3',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    const SizedBox(height: 16),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.colorText231F20,
                          wordSpacing: 1.82,
                          height: 1.3,
                          fontFamily: AppFonts.svnGotham,
                          fontWeight: FontWeight.w400,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: LocaleKeys
                                .onbroading_two_chain_text_step_three_one
                                .tr(),
                          ),
                          TextSpan(
                            text: '${LocaleKeys.espot.tr()} ',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                              text: LocaleKeys
                                  .onbroading_two_chain_text_step_three_two
                                  .tr()),
                          TextSpan(
                              text:
                                  '\n${LocaleKeys.onbroading_two_chain_text_step_three_three.tr()}'),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
