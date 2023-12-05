import 'package:bas_clean_architecture/core/const.dart';
import 'package:bas_clean_architecture/utils/index.dart';
import 'package:easy_localization/easy_localization.dart';

class FormatUtils {
  String displayDateAndTime(
      {String? dateAppointment, String? timeAppointment}) {
    if (dateAppointment == null || timeAppointment == null) {
      return '';
    }
    DateTime parsedDate = DateTime.parse(dateAppointment);
    String formattedDate = DateFormat('MMMM d, y | ').format(parsedDate);

    DateFormat inputFormat = DateFormat('HH:mm');
    DateFormat outputFormat = DateFormat('hh:mm a');
    DateTime parsedTime = inputFormat.parse(timeAppointment);
    String formattedTime = outputFormat.format(parsedTime);

    return formattedDate + formattedTime;
  }

  String displayDate({String? date, String? typeFormat}) {
    if (date == null) {
      return '';
    }
    DateTime? convertedDate =
        date.convertStringToDateWithFormat(typeFormat ?? "yyyy-MM-dd'T'HH:mm");
    if (convertedDate != null) {
      String formattedDate =
          '${convertedDate.year}-${convertedDate.day < 10 ? '0${convertedDate.day}' : convertedDate.day}-${convertedDate.month < 10 ? '0${convertedDate.month}' : convertedDate.month}';

      return formattedDate;
    } else {
      return '';
    }
  }

  String displayDate2({String? date, String? typeFormat}) {
    if (date == null) {
      return '';
    }
    DateTime currentDate = DateTime.parse(date);
    String formattedDate =
        DateFormat(typeFormat ?? standardTimeFormat).format(currentDate);
    return formattedDate;
  }

  String convertDateToString({DateTime? dateTime, String? typeFormat}) {
    if (dateTime == null) {
      return '';
    }

    String formattedDate =
        DateFormat(typeFormat ?? standardTimeFormat).format(dateTime);
    return formattedDate;
  }

  String displayTimeFromDateTime({DateTime? time, String? typeFormat}) {
    if (time == null) {
      return '';
    }

    String formattedDate = DateFormat(typeFormat ?? 'hh:mm a').format(time);
    return formattedDate;
  }

  String calculateAge(String index) {
    try {
      if (index.isEmpty) {
        return '0';
      }
      DateTime birthDate = DateTime.parse(index);
      DateTime currentDate = DateTime.now();

      int age = currentDate.year - birthDate.year;

      if (age < 0) return '';

      return age == 0 ? '1' : age.toString();
    } catch (e) {
      return '';
    }
  }

  String displayTime({String? time, String? typeFormat}) {
    if (time == null) {
      return '';
    }

    DateTime? convertedTime =
        time.convertStringToDateWithFormat(typeFormat ?? standardTimeFormat);
    if (convertedTime != null) {
      String formattedTime =
          '${convertedTime.hour < 10 ? '0${convertedTime.hour}' : convertedTime.hour}:${convertedTime.minute < 10 ? '0${convertedTime.minute}' : convertedTime.minute}${convertedTime.hour > 12 ? 'PM' : 'AM'}';
      return formattedTime;
    } else {
      return '';
    }
  }

  String formatDate({String? date, String? typeFormat}) {
    if (date == null || typeFormat == null) {
      return '';
    }
    DateTime parsedDate = DateFormat(typeFormat).parse(date);

    return '${parsedDate.year}-${parsedDate.month < 10 ? '0${parsedDate.month}' : parsedDate.month}-${parsedDate.day < 10 ? '0${parsedDate.day}' : parsedDate.day}';
  }

  String formatIsoTime(DateTime dateTime) {
    return '${dateTime.year.toString().padLeft(4, '0')}-'
        '${dateTime.month.toString().padLeft(2, '0')}-'
        '${dateTime.day.toString().padLeft(2, '0')}T'
        '${dateTime.hour.toString().padLeft(2, '0')}:'
        '${dateTime.minute.toString().padLeft(2, '0')}:'
        '${dateTime.second.toString().padLeft(2, '0')}.'
        '${dateTime.millisecond.toString().padLeft(3, '0')}Z';
  }

  String formatDayWithSuffix({String? dateTime, String? typeFormat}) {
    try {
      DateTime currentDate = DateTime.parse(dateTime ?? '');
      final format =
          DateFormat("d'${_getDaySuffix(currentDate.day)}' $typeFormat");
      //d'${_getDaySuffix(currentDate.day)}'
      return format.format(currentDate);
    } catch (e) {
      DateTime currentDate = DateTime.now();
      final format =
          DateFormat("d'${_getDaySuffix(currentDate.day)}' $typeFormat");
      return format.format(currentDate);
    }
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  String calculateDatetimeFilter(String dateTimeFilter, String typeFilter) {
    String? dateFilter;
    final DateTime dateTimeParse = DateTime.parse(dateTimeFilter);
    final DateTime now = DateTime.now();
    final DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final DateTime oneWeekLater = now.add(const Duration(days: 7));

    // logger.d('oneWeekLater $oneWeekLater');

    // logger.d('dateTimeParse $dateTimeParse');

    final DateTime lastOneWeek = now.add(const Duration(days: -7));

    final DateTime lastOneMonth = DateTime(
        now.year, now.month - 1, now.day, now.hour, now.minute, now.second);

    final DateTime lastOneQuarter = DateTime(
        now.year, now.month - 3, now.day, now.hour, now.minute, now.second);

    final DateTime lastOneYear = DateTime(
        now.year - 1, now.month, now.day, now.hour, now.minute, now.second);

    switch (typeFilter) {
      case 'This week':
        if (dateTimeParse.isAfter(startOfWeek) &&
            dateTimeParse.isBefore(oneWeekLater)) {
          dateFilter = convertDateToString(dateTime: dateTimeParse);
        }
        return dateFilter ?? '';
      case 'Last 7 days':
        if (dateTimeParse.isBefore(lastOneWeek)) {
          dateFilter = convertDateToString(dateTime: dateTimeParse);
        }
        return dateFilter ?? '';
      case 'Last 30 days':
        if (dateTimeParse.isBefore(lastOneMonth)) {
          dateFilter = convertDateToString(dateTime: dateTimeParse);
        }
        return dateFilter ?? '';
      case 'Last quarter':
        if (dateTimeParse.isBefore(lastOneQuarter)) {
          dateFilter = convertDateToString(dateTime: dateTimeParse);
        }
        return dateFilter ?? '';
      case 'Last year':
        if (dateTimeParse.isBefore(lastOneYear)) {
          dateFilter = convertDateToString(dateTime: dateTimeParse);
        }
        return dateFilter ?? '';
      case '+ Custom date':
        return '';
      default:
        return '';
    }
  }

  String capitalizeFirstLetter(String input) {
    if (input.isEmpty) {
      return input;
    }

    return input[0].toUpperCase() + input.substring(1);
  }

  String capitalizeWithName(String? firstName, String? lastName) {
    return '${FormatUtils().capitalizeFirstLetter(firstName ?? '')} ${FormatUtils().capitalizeFirstLetter(lastName ?? '')}';
  }

  String ValidationPhoneNumber(String phone) {
    if (phone.isNotEmpty && phone[0] == '0') {
      phone = phone.substring(1);
      return phone;
    } else {
      return phone;
    }
  }
}
