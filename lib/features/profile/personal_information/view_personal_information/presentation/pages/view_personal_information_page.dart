import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/features/profile/personal_information/change_password/presentation/pages/change_password_page.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class ViewPersonalInformationPage extends StatelessWidget {
  final UserProfileResponse? userProfileResponse;

  const ViewPersonalInformationPage({
    super.key,
    this.userProfileResponse,
  });

  @override
  Widget build(BuildContext context) {
    return BaseWrapperWidget(
      onReturn: () {
        PersistentNavBarNavigator.pushNewScreen(
          AppContext.navigatorKey.currentContext!,
          screen: const HomePage(indexTab: 4),
          withNavBar: true,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ViewInformationUserWidget(
                userProfileResponse: userProfileResponse),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: CText(
              text: LocaleKeys.info_person.tr(),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: CustomRowIconNameWidget(
              icon: AppAssets.iconProfileTelephone,
              isViewArrow: false,
              name: userProfileResponse?.tel ?? '',
            ),
          ),
          Container(height: 1, color: AppColors.colorF1F1F1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: CustomRowIconNameWidget(
              icon: AppAssets.iconProfileEmail,
              isViewArrow: false,
              name: userProfileResponse?.getEmail ?? '',
              textColor: userProfileResponse?.getEmail ==
                      LocaleKeys.not_update_email.tr()
                  ? AppColors.color979797
                  : AppColors.colorText514D56,
            ),
          ),
          Container(height: 1, color: AppColors.colorF1F1F1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: CustomRowIconNameWidget(
              icon: AppAssets.iconProfileCalenda,
              isViewArrow: false,
              name: userProfileResponse?.getDob ?? '',
              textColor: userProfileResponse?.getDob ==
                      LocaleKeys.not_update_birthday.tr()
                  ? AppColors.color979797
                  : AppColors.colorText514D56,
            ),
          ),
          Container(height: 1, color: AppColors.colorF1F1F1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: GestureDetector(
              onTap: () => PersistentNavBarNavigator.pushNewScreen(
                AppContext.navigatorKey.currentContext!,
                screen: const ChangePasswordPage(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              ),
              child: CustomRowIconNameWidget(
                icon: AppAssets.iconProfileChangePassword,
                isViewArrow: false,
                name: LocaleKeys.change_password.tr(),
              ),
            ),
          ),
          Container(height: 1, color: AppColors.colorF1F1F1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: CustomRowIconNameWidget(
              icon: AppAssets.iconProfileUpdateInfo,
              isViewArrow: false,
              name: LocaleKeys.update_infomation.tr(),
              textColor: AppColors.color039BE5,
            ),
          ),
          Container(height: 1, color: AppColors.colorF1F1F1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: CustomRowIconNameWidget(
              icon: AppAssets.iconProfileDeleteAccount,
              isViewArrow: false,
              name: LocaleKeys.delete_account.tr(),
            ),
          ),
          Container(height: 1, color: AppColors.colorF1F1F1),
        ],
      ),
    );
  }
}
