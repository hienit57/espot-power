import 'package:espot_power/utils/index.dart';

class LocationResponse {
  final int? id;
  final dynamic provincename;
  final dynamic cityname;
  final dynamic areaname;
  final String? shopName;
  final String? shopImageUrl;
  final String? minuteAddr;
  final String? completeAddr;
  final String? lng;
  final String? lat;
  final double? distance;
  final int? canBorrow;
  final int? canRepay;
  final String? masterTel;
  final String? startTime;
  final String? endTime;
  final dynamic workTimeDesc;
  final int? batteryTotal;
  final String? startTimestring;
  final String? endTimestring;
  final String? qrCode;
  final String? displayAddr;
  final String? shopAvatarUrl;
  final dynamic unitPrice;
  final dynamic money;
  final dynamic dayTopMoney;
  final dynamic totalTopMoney;
  final dynamic freeTime;

  LocationResponse({
    this.id,
    this.provincename,
    this.cityname,
    this.areaname,
    this.shopName,
    this.shopImageUrl,
    this.minuteAddr,
    this.completeAddr,
    this.lng,
    this.lat,
    this.distance,
    this.canBorrow,
    this.canRepay,
    this.masterTel,
    this.startTime,
    this.endTime,
    this.workTimeDesc,
    this.batteryTotal,
    this.startTimestring,
    this.endTimestring,
    this.qrCode,
    this.displayAddr,
    this.shopAvatarUrl,
    this.unitPrice,
    this.money,
    this.dayTopMoney,
    this.totalTopMoney,
    this.freeTime,
  });

  LocationResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        provincename = json['provincename'],
        cityname = json['cityname'],
        areaname = json['areaname'],
        shopName = json['shopName'] as String?,
        shopImageUrl = json['shopImageUrl'] as String?,
        minuteAddr = json['minuteAddr'] as String?,
        completeAddr = json['completeAddr'] as String?,
        lng = json['lng'] as String?,
        lat = json['lat'] as String?,
        distance = json['distance'] as double?,
        canBorrow = json['canBorrow'] as int?,
        canRepay = json['canRepay'] as int?,
        masterTel = json['masterTel'] as String?,
        startTime = json['startTime'] as String?,
        endTime = json['endTime'] as String?,
        workTimeDesc = json['workTimeDesc'],
        batteryTotal = json['batteryTotal'] as int?,
        startTimestring = json['startTimestring'] as String?,
        endTimestring = json['endTimestring'] as String?,
        qrCode = json['qrCode'] as String?,
        displayAddr = json['displayAddr'] as String?,
        shopAvatarUrl = json['shopAvatarUrl'] as String?,
        unitPrice = json['unitPrice'],
        money = json['money'],
        dayTopMoney = json['dayTopMoney'],
        totalTopMoney = json['totalTopMoney'],
        freeTime = json['freeTime'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'provincename': provincename,
        'cityname': cityname,
        'areaname': areaname,
        'shopName': shopName,
        'shopImageUrl': shopImageUrl,
        'minuteAddr': minuteAddr,
        'completeAddr': completeAddr,
        'lng': lng,
        'lat': lat,
        'distance': distance,
        'canBorrow': canBorrow,
        'canRepay': canRepay,
        'masterTel': masterTel,
        'startTime': startTime,
        'endTime': endTime,
        'workTimeDesc': workTimeDesc,
        'batteryTotal': batteryTotal,
        'startTimestring': startTimestring,
        'endTimestring': endTimestring,
        'qrCode': qrCode,
        'displayAddr': displayAddr,
        'shopAvatarUrl': shopAvatarUrl,
        'unitPrice': unitPrice,
        'money': money,
        'dayTopMoney': dayTopMoney,
        'totalTopMoney': totalTopMoney,
        'freeTime': freeTime
      };
}

extension LocationExt on LocationResponse {
  String get timeShopOpen => '$startTimestring - $endTimestring';

  String? get getPriceService => money != null
      ? '${FormatUtils().formatNumberWithCommas(money).toString()}đ'
      : '0đ';

  String? get getFreeTimeOfService =>
      freeTime != '0' ? '${freeTime.toInt()}' : '0';
}
