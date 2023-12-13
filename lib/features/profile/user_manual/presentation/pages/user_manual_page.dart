import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class UserManualPage extends StatelessWidget {
  const UserManualPage({super.key});

  static List<String> listTabUserManual = [
    LocaleKeys.rent_and_pay_batterry.tr(),
    LocaleKeys.payment.tr(),
    LocaleKeys.answer_question.tr(),
  ];

  @override
  Widget build(BuildContext context) {
    final userManualCubit = BlocProvider.of<UserManualCubit>(context);
    userManualCubit.emitSelectTab(0);
    userManualCubit.getUserManual();

    return BaseWrapperWidget(
      onReturn: () {
        NavigatorExt.push(
            AppContext.navigatorKey.currentContext!,
            const HomePage(
              indexTab: 4,
              child: AllScreenHome.profile,
            ));
      },
      child: BlocBuilder<UserManualCubit, UserManualState>(
        buildWhen: (previous, current) =>
            previous.onGetUserManual != current.onGetUserManual ||
            previous.guideId != current.guideId ||
            previous.listManualDisplay != current.listManualDisplay,
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(height: 24),
              Center(
                child: CText(
                  text: LocaleKeys.user_manual.tr(),
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: SizedBox(
                  height: 28,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: ListView.builder(
                      itemCount: listTabUserManual.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final item = listTabUserManual[index];
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              userManualCubit.emitSelectTab(index);
                              userManualCubit.getUserManual();
                            },
                            child: Column(
                              children: [
                                CText(
                                  text: item,
                                  fontSize: 14,
                                  textColor: state.indexSelectTab == index
                                      ? AppColors.colorText231F20
                                      : AppColors.color979797,
                                ),
                                const Spacer(),
                                Container(
                                  height: 2,
                                  width: 111,
                                  color: state.indexSelectTab == index
                                      ? AppColors.colorFFCB08
                                      : AppColors.white,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CButton(
                    height: 32,
                    width: 97,
                    radius: 10,
                    backgroundColor: state.isPayBattery == false
                        ? AppColors.colorFFCB08
                        : AppColors.colorEDEEF1,
                    titleFontSize: 12,
                    title: LocaleKeys.battery_rental.tr(),
                    titleFontWeight: FontWeight.w500,
                    onPressed: () {
                      userManualCubit.checkPayBattery('rent');
                    },
                  ),
                  const SizedBox(width: 12),
                  CButton(
                    height: 32,
                    width: 97,
                    radius: 10,
                    backgroundColor: state.isPayBattery == true
                        ? AppColors.colorFFCB08
                        : AppColors.colorEDEEF1,
                    title: LocaleKeys.battery_pay.tr(),
                    titleFontWeight: FontWeight.w500,
                    titleFontSize: 12,
                    onPressed: () {
                      userManualCubit.checkPayBattery('pay');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView(
                    padding: EdgeInsets.zero,
                    children: (state.listManualDisplay ?? [])
                        .map(
                          (element) => ItemManualWidget(
                            isOpen: state.guideId == element.guideId,
                            title: element.title,
                            content: element.content,
                            onTapOpen: () =>
                                userManualCubit.emitGuildId(element.guideId),
                            onTapClose: () => userManualCubit.emitGuildId(''),
                          ),
                        )
                        .toList()),
              ),
            ],
          );
        },
      ),
    );
  }
}
 // SizedBox(
              //   height: MediaQuery.of(context).size.height - 230,
              //   //height: MediaQuery.of(context).size.height - 165,
              //   child: PageView(
              //     controller: pageController,
              //     scrollDirection: Axis.horizontal,
              //     physics: const NeverScrollableScrollPhysics(),
              //     onPageChanged: (value) {
              //       userManualCubit.emitSelectTab(value);
              //     },
              //     children: [
              //       Container(),
              //       Container(),
              //       Container(),

              //       // PatientOverviewPage(
              //       //   onPressedSeeAllAppointment: () =>
              //       //       UIUtils().nextPage(pageController),
              //       // ),
              //       // const AppointmentsPatientPage(),
              //       // const DashboardMedicalHistoryPage(),
              //       // const PatientDocumentsPage()
              //     ],
              //   ),
              // ),