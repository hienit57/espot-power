import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class UserManualPage extends StatefulWidget {
  const UserManualPage({super.key});

  @override
  State<UserManualPage> createState() => _UserManualPageState();
}

class _UserManualPageState extends State<UserManualPage> {
  final pageController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  late UserManualCubit userManualCubit;

  @override
  void initState() {
    userManualCubit = BlocProvider.of<UserManualCubit>(context);
    userManualCubit.emitSelectTab(0);
    userManualCubit.getUserManual();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWrapperWidget(
      onReturn: () {},
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
                      itemCount: userManualCubit.listTabUserManual.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final item = userManualCubit.listTabUserManual[index];
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
              ...(state.listManualDisplay ?? []).map(
                (element) => ItemManualWidget(
                  isOpen: state.guideId == element.guideId,
                  title: element.title,
                  content: element.content,
                  onTap: () => userManualCubit.emitGuildId(element.guideId),
                ),
              )
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