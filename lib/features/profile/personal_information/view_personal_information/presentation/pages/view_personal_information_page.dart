import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/mixins/dialog_mixin.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class ViewPersonalInformationPage extends StatelessWidget with DialogMixin {
  const ViewPersonalInformationPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _dashboardProfileCubit =
        BlocProvider.of<DashboardProfileCubit>(context);
    _dashboardProfileCubit.getUserProfile();
    return BaseWrapperWidget(
      onReturn: () {
        NavigatorExt.push(
            AppContext.navigatorKey.currentContext!,
            const HomePage(
              indexTab: 4,
              child: AllScreenHome.profile,
            ));
      },
      child: BlocBuilder<DashboardProfileCubit, DashboardProfileState>(
        buildWhen: (previous, current) =>
            previous.onGetUserProfile != current.onGetUserProfile,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ViewInformationUserWidget(
                    userProfileResponse: state.userProfileResponse),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                child: CustomRowIconNameWidget(
                  icon: AppAssets.iconProfileTelephone,
                  isViewArrow: false,
                  name: state.userProfileResponse?.tel ?? '',
                ),
              ),
              Container(height: 1, color: AppColors.colorF1F1F1),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                child: CustomRowIconNameWidget(
                  icon: AppAssets.iconProfileEmail,
                  isViewArrow: false,
                  name: state.userProfileResponse?.getEmail ?? '',
                  textColor: state.userProfileResponse?.getEmail ==
                          LocaleKeys.not_update_email.tr()
                      ? AppColors.color979797
                      : AppColors.colorText514D56,
                ),
              ),
              Container(height: 1, color: AppColors.colorF1F1F1),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                child: CustomRowIconNameWidget(
                  icon: AppAssets.iconProfileCalenda,
                  isViewArrow: false,
                  name: state.userProfileResponse?.getDob ?? '',
                  textColor: state.userProfileResponse?.getDob ==
                          LocaleKeys.not_update_birthday.tr()
                      ? AppColors.color979797
                      : AppColors.colorText514D56,
                ),
              ),
              Container(height: 1, color: AppColors.colorF1F1F1),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => NavigatorExt.push(
                    AppContext.navigatorKey.currentContext!,
                    const ChangePasswordPage(),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => NavigatorExt.push(
                    AppContext.navigatorKey.currentContext!,
                    const UpdateInformationUserPage(),
                  ),
                  child: CustomRowIconNameWidget(
                    icon: AppAssets.iconProfileUpdateInfo,
                    isViewArrow: false,
                    name: LocaleKeys.update_infomation.tr(),
                    textColor: AppColors.color039BE5,
                  ),
                ),
              ),
              Container(height: 1, color: AppColors.colorF1F1F1),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    _onDeleteAccount(context);
                  },
                  child: CustomRowIconNameWidget(
                    icon: AppAssets.iconProfileDeleteAccount,
                    isViewArrow: false,
                    name: LocaleKeys.delete_account.tr(),
                  ),
                ),
              ),
              Container(height: 1, color: AppColors.colorF1F1F1),
            ],
          );
        },
      ),
    );
  }

  _onDeleteAccount(BuildContext context) {
    cShowGeneralDialog(
      context,
      widget: const Align(
        alignment: Alignment.center,
        child: IntrinsicHeight(
          child: DeleteAccountPage(),
        ),
      ),
    );
  }
}
