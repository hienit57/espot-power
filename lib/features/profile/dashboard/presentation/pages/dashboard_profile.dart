import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/mixins/dialog_mixin.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class DashboardProfilePage extends StatefulWidget {
  final VoidCallback? onSetLocaleEn;
  final VoidCallback? onSetLocaleVi;

  const DashboardProfilePage(
      {super.key, this.onSetLocaleEn, this.onSetLocaleVi});

  @override
  State<DashboardProfilePage> createState() => _DashboardProfilePageState();
}

class _DashboardProfilePageState extends State<DashboardProfilePage>
    with DialogMixin, AutomaticKeepAliveClientMixin {
  late DashboardProfileCubit _dashboardProfileCubit;

  @override
  void initState() {
    _dashboardProfileCubit = BlocProvider.of<DashboardProfileCubit>(context);
    _dashboardProfileCubit.getUserProfile();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                                behavior: HitTestBehavior.opaque,
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
            screen: const DashboardProfilePage(),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
            customPageRoute: MaterialPageRoute(
                builder: (_) => const ViewPersonalInformationPage()));
        break;
      case FeaturesProfile.userManual:
        PersistentNavBarNavigator.pushNewScreen(
          AppContext.navigatorKey.currentContext!,
          screen: const UserManualPage(),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
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
        _onLanguageSettings(AppContext.navigatorKey.currentContext!);
        break;
      case FeaturesProfile.contactForCooperation:
        PersistentNavBarNavigator.pushNewScreen(
          AppContext.navigatorKey.currentContext!,
          screen: const ContactForCooperationPage(),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
        break;
      case FeaturesProfile.feedback:
        PersistentNavBarNavigator.pushNewScreen(
          AppContext.navigatorKey.currentContext!,
          screen: const FeedbackPage(),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
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

  void _onLanguageSettings(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 270,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 9),
                Container(
                  width: 80,
                  height: 2.5,
                  color: AppColors.colorText231F20,
                ),
                const SizedBox(height: 12),
                CText(
                  text: LocaleKeys.change_language.tr(),
                  fontSize: 16,
                  fontWeight:
                      FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.5),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CContainer(
                    height: 52,
                    borderColor: AppColors.colorDADADA,
                    radius: 10,
                    onTap: () {
                      Navigator.pop(context);
                      widget.onSetLocaleVi?.call();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: CImage(
                              assetsPath: AppAssets.imgProfileVietnam,
                              width: 36,
                              height: 24,
                            ),
                          ),
                          CText(
                            text: LocaleKeys.language_vietnamese.tr(),
                            fontSize: 16,
                            fontWeight: FontWeight.lerp(
                                FontWeight.w400, FontWeight.w500, 0.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CContainer(
                    height: 52,
                    borderColor: AppColors.colorDADADA,
                    radius: 10,
                    onTap: () {
                      Navigator.pop(context);
                      widget.onSetLocaleEn?.call();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: CImage(
                              assetsPath: AppAssets.imgProfileEnglish,
                              width: 36,
                              height: 24,
                            ),
                          ),
                          CText(
                            text: LocaleKeys.language_english.tr(),
                            fontSize: 16,
                            fontWeight: FontWeight.lerp(
                                FontWeight.w400, FontWeight.w500, 0.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CText(
                  text: LocaleKeys.cancel.tr(),
                  onTap: () {
                    Navigator.pop(AppContext.navigatorKey.currentContext!);
                  },
                  fontWeight:
                      FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.5),
                ),
                const SizedBox(height: 41),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => false;
}
