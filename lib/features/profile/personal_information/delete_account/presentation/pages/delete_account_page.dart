import 'package:espot_power/common/index.dart';
import 'package:espot_power/common/widget/base_result_widget/result_page.dart';
import 'package:espot_power/core/routes/app_pages.dart';
import 'package:espot_power/core/routes/app_routes.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/widgets.dart';

class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _deleteAccountCubit = BlocProvider.of<DeleteAccountCubit>(context);
    _deleteAccountCubit.initData();
    _deleteAccountCubit.countdownTimer();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 37),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
        buildWhen: (previous, current) =>
            previous.indexCountdown != current.indexCountdown,
        listenWhen: (previous, current) =>
            previous.onDeleteAccount != current.onDeleteAccount,
        listener: (context, state) {
          if (state.codeResponse == 0) {
            BlocProvider.of<DashboardProfileCubit>(context).logout();
          }
          if (state.codeResponse == -8) {
            NavigatorExt.pushAndRemoveUntil(
                AppContext.navigatorKey.currentContext!,
                ResultPage(
                  title: LocaleKeys.title_delete_account_failed.tr(),
                  icon: AppAssets.iconCheckOutFailed,
                  customMessage: CText(
                    text: LocaleKeys.message_delete_account_failed_money.tr(),
                    textAlign: TextAlign.center,
                  ),
                  titleButtonOne: LocaleKeys.goback_home.tr(),
                  titleButtonTwo: LocaleKeys.check_information_account.tr(),
                  onTapButtonOne: () {
                    NavigatorExt.push(
                        AppContext.navigatorKey.currentContext!,
                        const HomePage(
                          indexTab: 0,
                          child: AllScreenHome.map,
                        ));
                  },
                  onTapButtonTwo: () {
                    NavigatorExt.push(
                        AppContext.navigatorKey.currentContext!,
                        const HomePage(
                          indexTab: 1,
                          child: AllScreenHome.transaction,
                        ));
                  },
                ),
                AppRoutes.personalInformation);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(height: 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CImage(
                    assetsPath: AppAssets.iconProfileDeleteAccount,
                    color: AppColors.colorFFCB05,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 12),
                  CText(
                    text: LocaleKeys.you_want_delete_account.tr(),
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
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 1,
                      child: CButton(
                        height: 40,
                        radius: 10,
                        title: state.indexCountdown == 0
                            ? LocaleKeys.delete.tr()
                            : '${state.indexCountdown} giây',
                        titleFontWeight: FontWeight.w500,
                        borderColor: state.indexCountdown == 0
                            ? AppColors.colorFFCB08
                            : AppColors.colorBorder,
                        backgroundColor: state.indexCountdown == 0
                            ? AppColors.colorFFCB08
                            : AppColors.colorBorder,
                        onPressed: () {
                          if (state.indexCountdown == 0) {
                            _deleteAccountCubit.deleteAccount();
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 36),
            ],
          );
        },
      ),
    );
  }
}
