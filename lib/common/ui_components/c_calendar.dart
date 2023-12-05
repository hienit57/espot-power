import 'package:bas_clean_architecture/common/ui_components/index.dart';
import 'package:bas_clean_architecture/index.dart';
import 'package:bas_clean_architecture/theme/index.dart';
import 'package:bas_clean_architecture/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class CCalendar extends StatefulWidget {
  final DateTime? dateSelect;
  final Function(DateTime, List<Event>)? onDayPressed;
  final VoidCallback? onCancelDate;
  final VoidCallback? onSetDate;
  final DateTime? startDate;
  final DateTime? endDate;

  const CCalendar({
    super.key,
    this.dateSelect,
    this.onDayPressed,
    this.onCancelDate,
    this.onSetDate,
    this.startDate,
    this.endDate,
  });

  @override
  State<CCalendar> createState() => _CCalendarState();
}

class _CCalendarState extends State<CCalendar> {
  final currentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 545.h,
      width: 273.w,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 20.h,
                left: 24.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CText(
                    text: LocaleKeys.select_date.tr(),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.charcoal.withOpacity(0.6),
                  ),
                  CText(
                    text: FormatUtils().convertDateToString(
                        dateTime: widget.dateSelect
                        // state.selectDateAppointment
                        ,
                        typeFormat: 'EE, MMMM d'),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
            ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
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
                height: 420.h,
                width: 300.w,

                //Dateime previos of day now
                selectedDateTime: widget.dateSelect,

                customGridViewPhysics: const NeverScrollableScrollPhysics(),

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
                customWeekDayBuilder: (weekday, weekdayName) {
                  if (weekdayName == 'Sun' && weekday == 0) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: 10.w,
                      ),
                      child: CText(
                        text: weekdayName,
                        textColor: Colors.red,
                        fontSize: 14.sp,
                      ),
                    );
                  } else if (weekdayName == 'Sat' && weekday == 6) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: 10.w,
                      ),
                      child: CText(
                        text: weekdayName,
                        textColor: Colors.red,
                        fontSize: 14.sp,
                      ),
                    );
                  } else if (weekdayName == 'Fri' && weekday == 5) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: 6.w,
                      ),
                      child: CText(
                        text: weekdayName,
                        fontSize: 14.sp,
                      ),
                    );
                  }
                  return CText(
                    text: weekdayName,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                  );
                },

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

                minSelectedDate: widget.startDate,
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
            Padding(
              padding: EdgeInsets.only(
                top: 10.h,
                right: 24.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CText(
                      text: LocaleKeys.cancel.tr(),
                      fontSize: 16.sp,
                      textColor: AppColors.brick,
                      tappedText: widget.onCancelDate),
                  SizedBox(width: 25.w),
                  CText(
                      text: LocaleKeys.set.tr(),
                      fontSize: 16.sp,
                      textColor: AppColors.brick,
                      fontWeight: FontWeight.w700,
                      tappedText: widget.onSetDate),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
