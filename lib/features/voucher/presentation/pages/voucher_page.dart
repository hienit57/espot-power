import 'package:espot_power/common/index.dart';
import 'package:espot_power/common/widget/base_result_widget/result_page.dart';
import 'package:espot_power/core/routes/app_pages.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/widgets.dart';

class VoucherPage extends StatelessWidget {
  const VoucherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _dashboardProfileCubit =
        BlocProvider.of<DashboardProfileCubit>(context);
    final voucherCubit = BlocProvider.of<VoucherCubit>(context);

    _dashboardProfileCubit.getUserProfile();
    voucherCubit.initState();

    return BaseWrapperWidget(
      isViewSupportProblem: true,
      onReturn: () {
        NavigatorExt.pop(AppContext.navigatorKey.currentContext!);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocConsumer<VoucherCubit, VoucherState>(
          buildWhen: (previous, current) =>
              previous.onApplyVoucher != current.onApplyVoucher,
          listenWhen: (previous, current) =>
              previous.onApplyVoucher != current.onApplyVoucher,
          listener: (context, state) {
            if (state.onApplyVoucher == RequestStatus.success) {
              NavigatorExt.pushAndRemoveUntil(
                  AppContext.navigatorKey.currentContext!,
                  ResultPage(
                    title: LocaleKeys.success_voucher.tr(),
                    icon: AppAssets.imgOrderSurplusVoucherSuccess,
                    paddingTop: 90,
                    heightImage: 289,
                    widthImage: double.infinity,
                    isHiddenProblem: true,
                    customMessage: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(
                              color: AppColors.colorText231F20,
                              fontWeight: FontWeight.w400,
                              fontFamily: AppFonts.svnGotham),
                          children: [
                            TextSpan(
                              text: LocaleKeys.message_voucher_one.tr(),
                            ),
                            TextSpan(
                              text: '${state.voucherResponse?.amount}đ',
                              style: TextStyle(
                                color: AppColors.colorFFCB08,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: LocaleKeys.message_voucher_two.tr(),
                              style: const TextStyle(
                                  fontFamily: AppFonts.svnGotham),
                            ),
                            TextSpan(
                              text: state.voucherResponse?.content,
                              style: TextStyle(
                                color: AppColors.colorFFCB08,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ]),
                    ),
                    titleButtonOne: LocaleKeys.goback_home.tr(),
                    titleButtonTwo: LocaleKeys.check_transaction_history.tr(),
                    onTapButtonOne: () {
                      NavigatorExt.push(
                        AppContext.navigatorKey.currentContext!,
                        const HomePage(
                          indexTab: 0,
                          child: AllScreenHome.map,
                        ),
                      );
                    },
                    onTapButtonTwo: () {
                      NavigatorExt.push(
                        AppContext.navigatorKey.currentContext!,
                        const HomePage(
                          indexTab: 1,
                          child: AllScreenHome.transaction,
                        ),
                      );
                    },
                  ),
                  AppRoutes.voucher);
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Center(
                  child: CText(
                    text: LocaleKeys.transfer.tr(),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 24),
                CContainer(
                  radius: 10,
                  backgroundColor: AppColors.color039BE5.withOpacity(0.1),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: BlocBuilder<DashboardProfileCubit,
                        DashboardProfileState>(
                      buildWhen: (previous, current) =>
                          previous.onGetUserProfile != current.onGetUserProfile,
                      builder: (context, state) {
                        return ViewInformationUserWidget(
                          userProfileResponse: state.userProfileResponse,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                CText(
                  text: LocaleKeys.voucher_of_me.tr(),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: voucherCubit.voucherController,
                  placeholder: LocaleKeys.hint_text_enter_voucher_code.tr(),
                  borderRadius: 10,
                  prefix: const Padding(
                    padding: EdgeInsets.all(11.0),
                    child: CImage(
                      assetsPath: AppAssets.iconTabbarOrderSurplusVoucher,
                    ),
                  ),
                  onChanged: (value) {
                    voucherCubit.resetState();
                  },
                ),
                Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      CText(
                        fontSize: 13,
                        textColor: AppColors.colorEC222D,
                        fontWeight: FontWeight.w400,
                        lineSpacing: 1,
                        text: state.msgApplyVoucher,
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 112),
                  child: CButton(
                    height: 40,
                    width: double.infinity,
                    radius: 10,
                    backgroundColor: AppColors.colorFFCB08,
                    title: LocaleKeys.continues.tr(),
                    titleFontWeight: FontWeight.w500,
                    onPressed: () => voucherCubit.applyVoucher(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
