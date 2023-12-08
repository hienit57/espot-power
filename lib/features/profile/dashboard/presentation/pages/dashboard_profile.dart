import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class DashboardProfilePage extends StatelessWidget {
  const DashboardProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _dashboardProfileCubit =
        BlocProvider.of<DashboardProfileCubit>(context);
    _dashboardProfileCubit.getUserProfile();
    return BlocBuilder<DashboardProfileCubit, DashboardProfileState>(
      buildWhen: (previous, current) =>
          previous.onGetUserProfile != current.onGetUserProfile,
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              const SizedBox(height: 64),
              CText(
                text: LocaleKeys.account_title.tr(),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ViewInformationUserWidget(
                  userProfileResponse: state.userProfileResponse,
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ViewFinanceWidget(
                  userProfileResponse: state.userProfileResponse,
                ),
              ),
              Column(
                children: FeaturesProfile.values
                    .map((element) => Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 24,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  onTapFeature(element);
                                },
                                child: CustomRowIconNameWidget(
                                  icon: element.icon,
                                  name: element.name,
                                ),
                              ),
                            ),
                            if (element != FeaturesProfile.logout) ...[
                              Container(
                                width: double.infinity,
                                height: 1,
                                color: AppColors.colorF1F1F1,
                              )
                            ]
                          ],
                        ))
                    .toList(),
              )
            ],
          ),
        );
      },
    );
  }

  void onTapFeature(FeaturesProfile value) {
    switch (value) {
      case FeaturesProfile.profileInformation:
        PersistentNavBarNavigator.pushNewScreen(
          AppContext.navigatorKey.currentContext!,
          screen: ViewPersonalInformationPage(),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
        break;
      case FeaturesProfile.userManual:
        break;
      case FeaturesProfile.informationAndSupportCenter:
        break;
      case FeaturesProfile.languageSettings:
        break;
      case FeaturesProfile.contactForCooperation:
        break;
      case FeaturesProfile.feedback:
        break;
      case FeaturesProfile.logout:
        break;
      default:
        break;
    }
  }
}
