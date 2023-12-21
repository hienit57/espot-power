import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:espot_power/core/const.dart';
import 'package:espot_power/utils/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

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

  String formatNumberWithCommas(dynamic number) {
    String formattedString = number.toInt().toString();

    final RegExp regExp = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    formattedString = formattedString.replaceAllMapped(
      regExp,
      (Match match) => '${match[1]},',
    );

    return formattedString;
  }

  String convertToMd5(String value) {
    return md5.convert(utf8.encode(value)).toString();
  }

  String convertTime(double count) {
    int hour = 0;
    int minutes = 0;
    if (count.toInt() > 60) {
      hour = count ~/ 60;
      minutes = count.toInt() % 60;
    } else {
      minutes = count.toInt();
    }
    return '${hour}h:${minutes}m';
  }

  String calculateTimeDifferenceAndFormat({
    String? startDate,
    String? startTime,
    String? endDate,
    String? endTime,
  }) {
    DateTime endDateTime;
    // Định dạng ngày và giờ
    DateTime startDateTime =
        DateFormat("yyyy-MM-dd HH:mm:ss").parse("$startDate $startTime");

    if (endDate == null || endTime == null) {
      endDateTime = DateTime.now();
    } else {
      endDateTime =
          DateFormat("yyyy-MM-dd HH:mm:ss").parse("$endDate $endTime");
    }

    // Tính thời gian giữa hai thời điểm
    Duration difference = endDateTime.difference(startDateTime);

    // Định dạng thời gian kết quả
    int hours = difference.inHours;
    int minutes = (difference.inSeconds / 60).ceil();

    String formattedDuration = '';

    if (hours > 0) {
      formattedDuration += '$hours giờ ';
    }

    if (minutes > 0 || hours == 0) {
      formattedDuration += '$minutes phút';
    }

    return formattedDuration.trim();
  }

  //Tinh số second so với hiện tại
  int calculateTimeDifferenceInSeconds(
      String? timeStartDate, String? timeStartTime) {
    // Chuyển đổi chuỗi thành DateTime
    DateTime startDateTime = DateFormat("yyyy-MM-dd HH:mm:ss")
        .parse("$timeStartDate $timeStartTime");

    // Lấy thời gian hiện tại
    DateTime now = DateTime.now();

    // Tính thời gian giữa hai thời điểm
    Duration difference = now.difference(startDateTime);

    // Lấy số giây giữa hai thời điểm
    int secondsDifference = difference.inSeconds;

    return secondsDifference;
  }

  ///Format dạng 00:00:00
  String? formatDuration(int seconds) {
    Duration duration = Duration(seconds: seconds);

    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    int remainingSeconds = duration.inSeconds.remainder(60);

    String formattedDuration =
        '$hours:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';

    return formattedDuration;
  }

  Future<String> calculateDistance(double latitude, double longitude) async {
    final location = Location();
    var currentLocation = await location.getLocation();
    double? currentLat = currentLocation.latitude;
    double? currentLong = currentLocation.longitude;

    if (currentLat != null && currentLong != null) {
      double distanceBetweenNewCenterMapPoint = Geolocator.distanceBetween(
          latitude, longitude, currentLat, currentLong);

      if (distanceBetweenNewCenterMapPoint < 1000) {
        return '${distanceBetweenNewCenterMapPoint.toStringAsFixed(2)}m';
      } else {
        double kilometers = distanceBetweenNewCenterMapPoint / 1000;
        return '${kilometers.toStringAsFixed(2)}km';
      }
    } else {
      return '0m';
    }
  }

  Future<LocationData> currentLocationUser() async {
    final location = Location();
    return await location.getLocation();
  }

  int calculateRemainingAmount(double currentAmount, double maxAmount) {
    double remainingAmount = maxAmount - currentAmount;
    int remainingThousands = (remainingAmount / 1000).ceil() * 1000;
    return remainingThousands;
  }

  LatLng caculateLatLng(String? lat, String? lon) {
    double latitude = double.parse(lat ?? '0.0');
    double longitude = double.parse(lon ?? '0.0');

    return LatLng(latitude, longitude);
  }

  double findShortestDistance(LatLng point1, LatLng point2) {
    const double earthRadius = 6371000; // Bán kính trái đất trong mét

    // Chuyển đổi độ sang radian
    double lat1Rad = radians(point1.latitude);
    double lon1Rad = radians(point1.longitude);
    double lat2Rad = radians(point2.latitude);
    double lon2Rad = radians(point2.longitude);

    // Tính chênh lệch giữa các độ lat và lon
    double latDiff = lat2Rad - lat1Rad;
    double lonDiff = lon2Rad - lon1Rad;

    // Tính khoảng cách sử dụng công thức haversine
    double a = sin(latDiff / 2) * sin(latDiff / 2) +
        cos(lat1Rad) * cos(lat2Rad) * sin(lonDiff / 2) * sin(lonDiff / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double distance = earthRadius * c;

    return distance;
  }

  double radians(double degrees) {
    return degrees * (pi / 180);
  }
}
