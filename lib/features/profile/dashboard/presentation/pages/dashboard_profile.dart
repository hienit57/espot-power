import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/mixins/dialog_mixin.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/features/profile/information_and_support_center/presentation/pages/information_and_support_center_page.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class DashboardProfilePage extends StatelessWidget with DialogMixin {
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
                                  onTapFeature(
                                    context,
                                    element,
                                    userProfileResponse:
                                        state.userProfileResponse,
                                  );
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

  void onTapFeature(
    BuildContext context,
    FeaturesProfile value, {
    UserProfileResponse? userProfileResponse,
  }) {
    switch (value) {
      case FeaturesProfile.profileInformation:
        PersistentNavBarNavigator.pushNewScreen(
          AppContext.navigatorKey.currentContext!,
          screen: const ViewPersonalInformationPage(),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
        break;
      case FeaturesProfile.userManual:
        break;
      case FeaturesProfile.informationAndSupportCenter:
        PersistentNavBarNavigator.pushNewScreen(
          AppContext.navigatorKey.currentContext!,
          screen: const InformationAndSupportCenterPage(),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
        break;
      case FeaturesProfile.languageSettings:
        break;
      case FeaturesProfile.contactForCooperation:
        break;
      case FeaturesProfile.feedback:
        break;
      case FeaturesProfile.logout:
        _onLogout(context);
        break;
      default:
        break;
    }
  }

  void _onLogout(BuildContext context) {
    cShowGeneralDialog(
      context,
      widget: Align(
        alignment: Alignment.center,
        child: IntrinsicHeight(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 37),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const SizedBox(height: 36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CImage(
                      assetsPath: AppAssets.iconProfileDialogLogout,
                      color: AppColors.colorFFCB05,
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 12),
                    CText(
                      text: LocaleKeys.want_to_logout.tr(),
                    )
                  ],
                ),
                const SizedBox(height: 38),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CButton(
                          height: 40,
                          radius: 10,
                          borderColor: AppColors.colorBorder,
                          backgroundColor: AppColors.colorBorder,
                          title: LocaleKeys.not_no.tr(),
                          titleFontWeight: FontWeight.w500,
                          onPressed: () {
                            Navigator.pop(
                                AppContext.navigatorKey.currentContext!);
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 1,
                        child: CButton(
                          height: 40,
                          radius: 10,
                          title: LocaleKeys.logout.tr(),
                          titleFontWeight: FontWeight.w500,
                          borderColor: AppColors.colorFFCB08,
                          backgroundColor: AppColors.colorFFCB08,
                          onPressed: () {
                            BlocProvider.of<DashboardProfileCubit>(context)
                                .logout();
                          },
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 36),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
