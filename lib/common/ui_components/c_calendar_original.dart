import 'package:bas_clean_architecture/common/ui_components/index.dart';
import 'package:bas_clean_architecture/index.dart';
import 'package:bas_clean_architecture/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class CCalendarOriginal extends StatefulWidget {
  DateTime? dateSelect;
  final Function(DateTime, List<Event>)? onDayPressed;
  final DateTime? startDate;
  final DateTime? endDate;

  CCalendarOriginal({
    super.key,
    this.dateSelect,
    this.onDayPressed,
    this.startDate,
    this.endDate,
  });

  @override
  State<CCalendarOriginal> createState() => _CCalendarOriginalState();
}

class _CCalendarOriginalState extends State<CCalendarOriginal> {
  final currentDate = DateTime.now();

  bool isViewSelectYear = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isViewSelectYear
                ? _calendarWhenClickChooseYear()
                : ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: true),
                    child: CalendarCarousel<Event>(
                      isScrollable: false,

                      viewportFraction: 1,

                      todayBorderColor: AppColors.brick,

                      //Style of day when onPress day
                      selectedDayButtonColor: AppColors.brick,

                      selectedDayBorderColor: AppColors.brick,

                      headerTextStyle: TextStyle(
                        color: AppColors.brick,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: AppFonts.plusJakartaSans,
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
                      height: 560.h,
                      width: 390.w,

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
                        fontSize: 16.sp,
                      ),

                      weekdayTextStyle: TextStyle(
                        color: AppColors.charcoal.withOpacity(0.8),
                        fontFamily: AppFonts.plusJakartaSans,
                        fontSize: 16.sp,
                      ),

                      //Format style name day of week
                      weekDayFormat: WeekdayFormat.standaloneShort,

                      //Custom style day of week
                      customWeekDayBuilder: (weekday, weekdayName) {
                        if (weekdayName == 'Sun' || weekday == 0) {
                          return Padding(
                            padding: EdgeInsets.only(left: 18.w, bottom: 10.h),
                            child: CText(
                              text: weekdayName,
                              textColor: Colors.red,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          );
                        } else if (weekdayName == 'Sat' || weekday == 6) {
                          return Padding(
                            padding: EdgeInsets.only(right: 18.w, bottom: 10.h),
                            child: CText(
                              text: weekdayName,
                              textColor: Colors.red,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          );
                        } else if (weekdayName == 'Fri' && weekday == 5) {
                          return Padding(
                            padding: EdgeInsets.only(right: 7.w, bottom: 10.h),
                            child: CText(
                              text: weekdayName,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          );
                        }
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: CText(
                            text: weekdayName,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            textAlign: TextAlign.center,
                          ),
                        );
                      },

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

                      //Header Title
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
    );
  }

  Widget _calendarWhenClickChooseYear() => const CImage(
        assetsPath: AppAssets.imCalendarSidebar,
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
        itemCount: getListYear(2020).length,
        itemBuilder: (context, index) {
          return CButton(
            height: 30.h,
            width: double.infinity,
            borderColor: AppColors.white,
            onPressed: () {
              setState(() {
                widget.dateSelect = DateTime.parse(
                    '${getListYear(2020)[index].toString()}-01-01 00:00:00Z');
                isViewSelectYear = false;
              });
            },
            child: CText(
              text: getListYear(2020)[index].toString(),
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
    int yearNow = 2050;
    List<int> listYear =
        List.generate(yearNow - limit, (index) => (limit + index));
    return listYear;
  }
}
