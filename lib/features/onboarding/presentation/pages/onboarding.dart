import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late OnboardingCubit _onboardingCubit;

  @override
  void initState() {
    _onboardingCubit = BlocProvider.of<OnboardingCubit>(context);
    _onboardingCubit.emitOnboadingPage(OnboardingListPage.onboardingOne);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFFFFCB04).withOpacity(0.3),
              Color(0xFFFFD227).withOpacity(0.3),
              Color(0xFFFFF9E3).withOpacity(0.3),
            ],
            stops: const [0.0123, 0.163, 0.9768],
          ),
        ),
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          buildWhen: (previous, current) =>
              previous.selectedOnboardingPage != current.selectedOnboardingPage,
          builder: (context, state) {
            return Column(
              children: [
                if (state.selectedOnboardingPage ==
                    OnboardingListPage.onboardingOne) ...[
                  const OnboardingOneWidget()
                ] else ...[
                  const OnboardingTwoWidget()
                ],
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      List.generate(OnboardingListPage.values.length, (index) {
                    return _buildDot(
                      indexDot: OnboardingListPage.values[index],
                      indexDotSelected: state.selectedOnboardingPage,
                    );
                  }),
                ),
                const SizedBox(height: 24),
                if (state.selectedOnboardingPage ==
                    OnboardingListPage.onboardingOne) ...[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 54),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 40,
                          height: 40,
                        ),
                        CContainer(
                          onTap: () {
                            _onboardingCubit.onPushInApp();
                          },
                          width: 102,
                          height: 40,
                          backgroundColor: AppColors.colorBorder,
                          borderColor: AppColors.colorBorder,
                          radius: 10,
                          child: Center(
                            child: CText(
                              text: LocaleKeys.skip.tr(),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _onboardingCubit.emitOnboadingPage(
                                OnboardingListPage.onboardingTwo);
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.colorFFCB05,
                            ),
                            child: const Center(
                              child: CImage(
                                assetsPath: AppAssets.iconOnBroadingArrowRight,
                                width: 24,
                                height: 24,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ] else ...[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 54),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _onboardingCubit.emitOnboadingPage(
                                OnboardingListPage.onboardingOne);
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    AppColors.colorText231F20.withOpacity(0.2)),
                            child: const Center(
                              child: CImage(
                                assetsPath: AppAssets.iconOnBroadingArrowLeft,
                                width: 24,
                                height: 24,
                                boxFit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        CContainer(
                          onTap: () {
                            _onboardingCubit.onPushInApp();
                          },
                          width: 120,
                          height: 40,
                          backgroundColor: AppColors.colorFFCB05,
                          borderColor: AppColors.colorFFCB05,
                          radius: 10,
                          child: Center(
                            child: CText(
                              text: LocaleKeys.start.tr(),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]
              ],
            );
          },
        ),
      ),
    );
  }

  AnimatedContainer _buildDot(
      {OnboardingListPage? indexDot, OnboardingListPage? indexDotSelected}) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 50),
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
          color: indexDot == indexDotSelected
              ? AppColors.colorFFCB05
              : AppColors.colorText231F20.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8)),
      width: indexDot == indexDotSelected ? 20 : 8,
      height: 8,
    );
  }
}
