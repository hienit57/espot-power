import 'package:espot_power/utils/index.dart';

class InformationChargingStationReponse {
  final dynamic provincename;
  final dynamic cityname;
  final dynamic areaname;
  final int? shopId;
  final int? platformId;
  final String? sn;
  final String? codeNum;
  final String? shopName;
  final String? industry;
  final String? lng;
  final String? lat;
  final int? level1;
  final int? level2;
  final int? level3;
  final int? level4;
  final int? level5;
  final int? level6;
  final String? info;
  final String? batterySharp;
  final int? batteryCanBorrow;
  final int? batteryCanRepay;
  final int? batteryLock;
  final int? batteryTotal;
  final int? batteryError;
  final int? ysize;
  final int? xsize;
  final List<Battery>? battery;
  final int? heartStamp;
  final int? redisStamp;
  final String? status;
  final dynamic vendor;
  final dynamic totalMoney;
  final dynamic dayMoney;
  final dynamic monthMoney;
  final dynamic dayTime;
  final dynamic monthTime;
  final String? completeAddr;
  final String? masterTel;
  final String? espotTel;
  final String? shopImageUrl;

  InformationChargingStationReponse({
    this.provincename,
    this.cityname,
    this.areaname,
    this.shopId,
    this.platformId,
    this.sn,
    this.codeNum,
    this.shopName,
    this.industry,
    this.lng,
    this.lat,
    this.level1,
    this.level2,
    this.level3,
    this.level4,
    this.level5,
    this.level6,
    this.info,
    this.batterySharp,
    this.batteryCanBorrow,
    this.batteryCanRepay,
    this.batteryLock,
    this.batteryTotal,
    this.batteryError,
    this.ysize,
    this.xsize,
    this.battery,
    this.heartStamp,
    this.redisStamp,
    this.status,
    this.vendor,
    this.totalMoney,
    this.dayMoney,
    this.monthMoney,
    this.dayTime,
    this.monthTime,
    this.completeAddr,
    this.masterTel,
    this.espotTel,
    this.shopImageUrl,
  });

  InformationChargingStationReponse.fromJson(Map<String, dynamic> json)
      : provincename = json['provincename'],
        cityname = json['cityname'],
        areaname = json['areaname'],
        shopId = json['shopId'] as int?,
        platformId = json['platformId'] as int?,
        sn = json['sn'] as String?,
        codeNum = json['codeNum'] as String?,
        shopName = json['shopName'] as String?,
        industry = json['industry'] as String?,
        lng = json['lng'] as String?,
        lat = json['lat'] as String?,
        level1 = json['level1'] as int?,
        level2 = json['level2'] as int?,
        level3 = json['level3'] as int?,
        level4 = json['level4'] as int?,
        level5 = json['level5'] as int?,
        level6 = json['level6'] as int?,
        info = json['info'] as String?,
        batterySharp = json['batterySharp'] as String?,
        batteryCanBorrow = json['batteryCanBorrow'] as int?,
        batteryCanRepay = json['batteryCanRepay'] as int?,
        batteryLock = json['batteryLock'] as int?,
        batteryTotal = json['batteryTotal'] as int?,
        batteryError = json['batteryError'] as int?,
        ysize = json['ysize'] as int?,
        xsize = json['xsize'] as int?,
        battery = (json['battery'] as List?)
            ?.map((dynamic e) => Battery.fromJson(e as Map<String, dynamic>))
            .toList(),
        heartStamp = json['heartStamp'] as int?,
        redisStamp = json['redisStamp'] as int?,
        status = json['status'] as String?,
        vendor = json['vendor'],
        totalMoney = json['totalMoney'],
        dayMoney = json['dayMoney'],
        monthMoney = json['monthMoney'],
        dayTime = json['dayTime'],
        monthTime = json['monthTime'],
        completeAddr = json['completeAddr'] as String?,
        masterTel = json['masterTel'] as String?,
        espotTel = json['espotTel'] as String?,
        shopImageUrl = json['shopImageUrl'] as String?;

  Map<String, dynamic> toJson() => {
        'provincename': provincename,
        'cityname': cityname,
        'areaname': areaname,
        'shopId': shopId,
        'platformId': platformId,
        'sn': sn,
        'codeNum': codeNum,
        'shopName': shopName,
        'industry': industry,
        'lng': lng,
        'lat': lat,
        'level1': level1,
        'level2': level2,
        'level3': level3,
        'level4': level4,
        'level5': level5,
        'level6': level6,
        'info': info,
        'batterySharp': batterySharp,
        'batteryCanBorrow': batteryCanBorrow,
        'batteryCanRepay': batteryCanRepay,
        'batteryLock': batteryLock,
        'batteryTotal': batteryTotal,
        'batteryError': batteryError,
        'ysize': ysize,
        'xsize': xsize,
        'battery': battery?.map((e) => e.toJson()).toList(),
        'heartStamp': heartStamp,
        'redisStamp': redisStamp,
        'status': status,
        'vendor': vendor,
        'totalMoney': totalMoney,
        'dayMoney': dayMoney,
        'monthMoney': monthMoney,
        'dayTime': dayTime,
        'monthTime': monthTime,
        'completeAddr': completeAddr,
        'masterTel': masterTel,
        'espotTel': espotTel,
        'shopImageUrl': shopImageUrl
      };
}

class Battery {
  final String? site;
  final String? status;
  final int? quantity;
  final String? batteryId;
  final List<int>? xy;

  Battery({
    this.site,
    this.status,
    this.quantity,
    this.batteryId,
    this.xy,
  });

  Battery.fromJson(Map<String, dynamic> json)
      : site = json['site'] as String?,
        status = json['status'] as String?,
        quantity = json['quantity'] as int?,
        batteryId = json['batteryId'] as String?,
        xy = (json['xy'] as List?)?.map((dynamic e) => e as int).toList();

  Map<String, dynamic> toJson() => {
        'site': site,
        'status': status,
        'quantity': quantity,
        'batteryId': batteryId,
        'xy': xy
      };
}

extension InformationChargingStationExt on InformationChargingStationReponse {
  String? get getPriceInHour => monthMoney != null
      ? '${FormatUtils().formatNumberWithCommas(monthMoney).toString()}đ/giờ'
      : '0đ/giờ';

  bool? get isStatusChargingStation => status == 'online';
}
