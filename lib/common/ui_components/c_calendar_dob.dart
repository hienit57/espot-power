import 'package:bas_clean_architecture/common/index.dart';
import 'package:bas_clean_architecture/index.dart';
import 'package:bas_clean_architecture/theme/index.dart';
import 'package:bas_clean_architecture/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class CCalendarDOB extends StatefulWidget {
  DateTime? dateSelect;
  final Function(DateTime, List<Event>)? onDayPressed;
  final VoidCallback? onCancelDate;
  final VoidCallback? onSetDate;
  final DateTime? endDate;

  CCalendarDOB({
    super.key,
    this.dateSelect,
    this.onDayPressed,
    this.onCancelDate,
    this.onSetDate,
    this.endDate,
  });

  @override
  State<CCalendarDOB> createState() => _CCalendarDOBState();
}

class _CCalendarDOBState extends State<CCalendarDOB> {
  bool isViewSelectYear = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 505.h,
      width: 258.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Center(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding: EdgeInsets.only(
                //     top: 20.h,
                //     left: 24.w,
                //     right: 24.w,
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           CText(
                //             text: LocaleKeys.select_date.tr(),
                //             fontSize: 16.sp,
                //             fontWeight: FontWeight.w500,
                //             textColor: AppColors.charcoal.withOpacity(0.6),
                //           ),
                //           CText(
                //             text: FormatUtils().displayDateFromDateTime(
                //                 dateTime: widget.dateSelect
                //                 // state.selectDateAppointment
                //                 ,
                //                 typeFormat: 'EE, MMMM d'),
                //             fontSize: 17.sp,
                //             fontWeight: FontWeight.w700,
                //           ),
                //         ],
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           CText(
                //             text: 'Select Year',
                //             fontSize: 16.sp,
                //             fontWeight: FontWeight.w500,
                //             textColor: AppColors.charcoal.withOpacity(0.6),
                //             tappedText: () => setState(() {
                //               isViewSelectYear = true;
                //             }),
                //           ),
                //           CText(
                //             text: widget.dateSelect?.year.toString(),
                //             fontSize: 24.sp,
                //             fontWeight: FontWeight.w700,
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                isViewSelectYear
                    ? _calendarWhenClickChooseYear()
                    : ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context)
                            .copyWith(scrollbars: false),
                        child: CalendarCarousel<Event>(
                          viewportFraction: 1,

                          todayBorderColor: AppColors.brick,

                          //Style of day when onPress day
                          selectedDayButtonColor: AppColors.brick,

                          selectedDayBorderColor: AppColors.brick,

                          headerTextStyle: TextStyle(
                            color: AppColors.brick,
                            fontSize: 30.sp,
                          ),

                          //daysHaveCircularBorder: true,
                          showOnlyCurrentMonthDate: true,

                          //ColorWeekend
                          weekendTextStyle: const TextStyle(
                            color: Colors.red,
                          ),

                          thisMonthDayBorderColor: Colors.grey,

                          weekFormat: false,

                          //firstDayOfWeek: 4,
                          //markedDatesMap: _markedDateMap,
                          height: 430.h,
                          width: 258.w,

                          //Dateime previos of day now
                          selectedDateTime: widget.dateSelect ??
                              DateTime.parse(
                                  '${widget.dateSelect?.year.toString()}-01-01 00:00:00Z'),

                          customGridViewPhysics:
                              const NeverScrollableScrollPhysics(),

                          //Onclick day

                          onDayPressed: widget.onDayPressed,

                          // markedDateCustomShapeBorder:
                          //     CircleBorder(side: BorderSide(color: Colors.yellow)),
                          // markedDateCustomTextStyle: TextStyle(
                          //   fontSize: 18,
                          //   color: Colors.blue,
                          // ),
                          showHeader: true,

                          markedDateIconBorderColor: AppColors.charcoal,

                          iconColor: AppColors.charcoal,

                          //Color day of week and my style
                          todayTextStyle: TextStyle(
                            color: AppColors.charcoal.withOpacity(0.8),
                            fontFamily: AppFonts.plusJakartaSans,
                            fontSize: 14.sp,
                          ),

                          weekdayTextStyle: TextStyle(
                            color: AppColors.charcoal.withOpacity(0.8),
                            fontFamily: AppFonts.plusJakartaSans,
                            fontSize: 14.sp,
                          ),

                          //Format style name day of week
                          weekDayFormat: WeekdayFormat.standaloneShort,

                          //Custom style day of week
                          // customWeekDayBuilder: (weekday, weekdayName) {
                          //   if (weekdayName == 'S' && weekday == 0) {
                          //     return Padding(
                          //       padding: EdgeInsets.only(
                          //         left: 15.w,
                          //       ),
                          //       child: CText(
                          //         text: weekdayName,
                          //         textColor: Colors.red,
                          //         fontSize: 14.sp,
                          //       ),
                          //     );
                          //   } else if (weekdayName == 'S' && weekday == 6) {
                          //     return Padding(
                          //       padding: EdgeInsets.only(
                          //         right: 15.w,
                          //       ),
                          //       child: CText(
                          //         text: weekdayName,
                          //         textColor: Colors.red,
                          //         fontSize: 14.sp,
                          //       ),
                          //     );
                          //   }
                          //   return CText(
                          //     text: weekdayName,
                          //     fontSize: 14.sp,
                          //     fontWeight: FontWeight.w400,
                          //   );
                          // },
                          // markedDateShowIcon: true,
                          // markedDateIconMaxShown: 2,
                          // markedDateIconBuilder: (event) {
                          //   return event.icon;
                          // },
                          // markedDateMoreShowTotal:
                          //     true,
                          todayButtonColor: AppColors.grey30,
                          selectedDayTextStyle: const TextStyle(
                            color: AppColors.white,
                          ),

                          minSelectedDate: DateTime.parse(
                              '${widget.dateSelect?.year.toString()}-01-01 00:00:00Z'),
                          //DateTime.now().subtract(const Duration(days: 360)),
                          maxSelectedDate: widget.endDate,
                          //Style Previos And Next Month
                          prevDaysTextStyle: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.charcoal.withOpacity(0.4),
                          ),
                          nextDaysTextStyle: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.charcoal.withOpacity(0.4),
                          ),
                          daysTextStyle: TextStyle(
                            color: AppColors.charcoal.withOpacity(0.8),
                            fontFamily: AppFonts.plusJakartaSans,
                            fontSize: 14.sp,
                          ),
                          inactiveDaysTextStyle: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.charcoal.withOpacity(0.4),
                          ),

                          headerTitleTouchable: true,
                          onHeaderTitlePressed: () {
                            setState(() {
                              isViewSelectYear = true;
                            });
                          },

                          //When choose month deference
                          // onCalendarChanged: (DateTime date) {
                          //   this.setState(() {
                          //   setState(() {
                          //     _targetDateTime = date;
                          //   });
                          //   currentMonth =
                          //       DateFormat.yMMM().format(_targetDateTime);
                          //   });
                          // },
                          onDayLongPressed: (DateTime date) {
                            print('long pressed date $date');
                          },
                        ),
                      ),
                isViewSelectYear
                    ? const SizedBox()
                    : Padding(
                        padding: EdgeInsets.only(
                          top: 30.h,
                          right: 15.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: CText(
                                text: LocaleKeys.cancel.tr(),
                                fontSize: 16.sp,
                                textColor: AppColors.brick,
                                tappedText: widget.onCancelDate,
                              ),
                            ),
                            SizedBox(width: 25.w),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: CText(
                                text: LocaleKeys.set.tr(),
                                fontSize: 16.sp,
                                textColor: AppColors.brick,
                                fontWeight: FontWeight.w700,
                                tappedText: widget.onSetDate,
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
            isViewSelectYear == true
                ? Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 60.h),
                      child: _dropdownYearWidget(),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _calendarWhenClickChooseYear() => Stack(
        children: [
          CImage(
            height: 475.h,
            assetsPath: AppAssets.imViewDatePicker,
            boxFit: BoxFit.cover,
          ),
          Container(
            height: 60.h,
            width: 258.w,
            color: AppColors.white,
            child: Padding(
              padding: EdgeInsets.only(
                left: 3.w,
                right: 3.w,
                top: 15.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.chevron_left, color: AppColors.charcoal),
                  CText(
                    text: FormatUtils().convertDateToString(
                        dateTime: widget.dateSelect, typeFormat: 'MMM yyyy'),
                    fontSize: 27.sp,
                    fontWeight: FontWeight.w800,
                    textColor: AppColors.brick,
                  ),
                  const Icon(Icons.chevron_right, color: AppColors.charcoal),
                ],
              ),
            ),
          ),
        ],
      );

  Widget _dropdownYearWidget() {
    return Container(
      width: 90.w,
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: ListView.builder(
        itemCount: getListYear(1950).length,
        itemBuilder: (context, index) {
          return CButton(
            height: 30.h,
            width: double.infinity,
            borderColor: AppColors.white,
            onPressed: () {
              setState(() {
                widget.dateSelect = DateTime.parse(
                    '${getListYear(1950)[index].toString()}-01-01 00:00:00Z');
                isViewSelectYear = false;
              });
            },
            child: CText(
              text: getListYear(1950)[index].toString(),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
              textColor: AppColors.charcoal.withOpacity(0.6),
            ),
          );
        },
      ),
    );
  }

  List<int> getListYear(int limit) {
    int yearNow = DateTime.now().year;
    List<int> listYear =
        List.generate(yearNow - limit, (index) => (limit + index));
    return listYear;
  }
}
