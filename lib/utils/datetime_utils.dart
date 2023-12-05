import 'dart:math';

import 'package:bas_clean_architecture/utils/string_utils.dart';
import 'package:bas_clean_architecture/utils/time_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension LocalTimeFormatter on String? {
  String get formatToDisplay {
    try {
      if (this == null || this!.isEmpty) {
        return "";
      }
      DateTime date = DateFormat('yyyy-MM-dd hh:mm').parse(this!);
      if (TimeUtils.timeIsToday(date)) {
        return getHoursDisplay;
      } else {
        return '${StringUtils.monthsInYear[date.month]} ${date.day}, ${date.year}';
      }
    } catch (e) {
      return "";
    }
  }

  String getDateWithDateFormat(String dateFormat) {
    try {
      if (this == null || this!.isEmpty) {
        return "";
      }
      DateTime date = DateFormat(dateFormat).parse(this!);
      return '${date.month < 10 ? '0${date.month}' : date.month}/${date.day < 10 ? '0${date.day}' : date.day}/${date.year}';
    } catch (e) {
      return '$this';
    }
  }

  String get formatToDisplayDate {
    try {
      if (this == null || this!.isEmpty) {
        return "";
      }
      DateTime date = DateFormat('yyyy-MM-dd hh:mm').parse(this!);
      return '${StringUtils.monthsInYear[date.month]} ${date.day}, ${date.year} ';
    } catch (e) {
      return "";
    }
  }

  String get formatToDisplayFullDate {
    try {
      if (this == null || this!.isEmpty) {
        return "";
      }
      DateTime date = DateFormat('yyyy-MM-dd hh:mm').parse(this!);
      return '$getHoursDisplay, ${StringUtils.monthsInYear[date.month]} ${date.day}, ${date.year}';
    } catch (e) {
      return "";
    }
  }

  String get getHoursDisplay {
    if (this != null) {
      DateTime scheduleDate = DateFormat("yyyy-MM-dd hh:mm").parse(this!);
      TimeOfDay noonTime =
          TimeOfDay(hour: scheduleDate.hour, minute: scheduleDate.minute);
      String? suffixText;
      if (noonTime.period == DayPeriod.am) {
        suffixText = 'AM';
      } else {
        suffixText = 'PM';
      }

      int noonTimeHour = noonTime.hour;

      if (noonTimeHour == 0) {
        noonTimeHour = 12;
      } else if (noonTimeHour > 12) {
        noonTimeHour -= 12;
      }
      return '$noonTimeHour:${noonTime.minute < 10 ? '0${noonTime.minute}' : '${noonTime.minute}'} $suffixText';
    }
    return '';
  }

  String getHoursDisplayWithDatFormat({String? dateFormat}) {
    if (this != null) {
      try {
        DateTime scheduleDate = DateFormat(dateFormat).parse(this!);
        TimeOfDay noonTime =
            TimeOfDay(hour: scheduleDate.hour, minute: scheduleDate.minute);
        String? suffixText;
        if (noonTime.period == DayPeriod.am) {
          suffixText = 'AM';
        } else {
          suffixText = 'PM';
        }

        int noonTimeHour = noonTime.hour;

        if (noonTimeHour == 0) {
          noonTimeHour = 12;
        } else if (noonTimeHour > 12) {
          noonTimeHour -= 12;
        }
        return '$noonTimeHour:${noonTime.minute < 10 ? '0${noonTime.minute}' : '${noonTime.minute}'} $suffixText';
      } catch (e) {
        return '';
      }
    }
    return '';
  }

  String displayWithFormat({String? format}) {
    try {
      if (this == null || this!.isEmpty) {
        return "";
      }
      format ??= 'MMMM dd, yyyy';
      final date = DateTime.parse(this!).toLocal();

      return DateFormat(format).format(date);
    } catch (e) {
      return "";
    }
  }

  DateTime? convertStringToDate({String? formatType}) {
    if (this != null) {
      return DateFormat(formatType ?? "yyyy-MM-dd hh:mm").parse(this!);
    }
    return null;
  }

  DateTime? convertStringToDateWithFormat(String format) {
    if (this != null) {
      return DateFormat(format).parse(this!);
    }
    return null;
  }

  bool get isExpiredDate {
    try {
      if (this == null || this!.isEmpty) {
        return true;
      }

      final date = DateTime.parse(this!).toLocal();

      return date.isAfter(DateTime.now());
    } catch (e) {
      return true;
    }
  }

  String get removeAllHtmlTags {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return this!.replaceAll(exp, '');
  }
}

class DateTextFormatter extends TextInputFormatter {
  static const _maxChars = 8;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String separator = '/';
    var text = _format(
      newValue.text,
      oldValue.text,
      separator,
    );

    return newValue.copyWith(
      text: text,
      selection: updateCursorPosition(
        oldValue,
        text,
      ),
    );
  }

  String _format(
    String value,
    String oldValue,
    String separator,
  ) {
    var isErasing = value.length < oldValue.length;
    var isComplete = value.length > _maxChars + 2;

    if (!isErasing && isComplete) {
      return oldValue;
    }

    value = value.replaceAll(separator, '');
    final result = <String>[];

    for (int i = 0; i < min(value.length, _maxChars); i++) {
      result.add(value[i]);
      if ((i == 1 || i == 3) && i != value.length - 1) {
        result.add(separator);
      }
    }

    return result.join();
  }

  TextSelection updateCursorPosition(
    TextEditingValue oldValue,
    String text,
  ) {
    var endOffset = max(
      oldValue.text.length - oldValue.selection.end,
      0,
    );

    var selectionEnd = text.length - endOffset;

    return TextSelection.fromPosition(TextPosition(offset: selectionEnd));
  }
}
