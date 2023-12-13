import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:espot_power/utils/index.dart';
import 'package:flutter/material.dart';

class OrderResponse {
  final int? id;
  final int? stampStart;
  final int? stampEnd;
  final String? timeStartDate;
  final String? timeStartTime;
  final String? timeEndDate;
  final String? timeEndTime;
  final int? equipmentId;
  final String? equipmentSn;
  final String? equipmentCode;
  final String? batterySn;
  final String? batteryPipeNum;
  final String? rentEe;
  final String? backEe;
  final int? shopId;
  final int? shopIdBack;
  final String? shopName;
  final String? shopNameBack;
  final String? shopTel;
  final String? shopAddr;
  final int? visitorId;
  final String? visitorName;
  final String? visitorTel;
  final String? visitorOpenid;
  final String? backBatteryStatus;
  final String? type;
  final dynamic price;
  final String? status;
  final String? outOrderNo;
  final dynamic vipTime;
  final dynamic vipTimeStamp;
  final dynamic unitPrice;
  final dynamic unitTime;
  final dynamic money;
  final dynamic dayTopMoney;
  final dynamic totalTopMoney;
  final dynamic freeTime;
  final int? createTimeStamp;
  final String? updateTime;
  final int? orderUseMinutes;
  final int? platformId;
  final int? userId;
  final String? statusGroup;
  final dynamic deposit;
  final int? amount;
  final dynamic totalAmount;
  final dynamic discountAmount;
  final int? accountingMinutes;
  final String? displayAddr;
  final String? displayAddrBack;
  final String? shopAvatarUrl;
  final String? shopBackAvatarUrl;

  OrderResponse({
    this.id,
    this.stampStart,
    this.stampEnd,
    this.timeStartDate,
    this.timeStartTime,
    this.timeEndDate,
    this.timeEndTime,
    this.equipmentId,
    this.equipmentSn,
    this.equipmentCode,
    this.batterySn,
    this.batteryPipeNum,
    this.rentEe,
    this.backEe,
    this.shopId,
    this.shopIdBack,
    this.shopName,
    this.shopNameBack,
    this.shopTel,
    this.shopAddr,
    this.visitorId,
    this.visitorName,
    this.visitorTel,
    this.visitorOpenid,
    this.backBatteryStatus,
    this.type,
    this.price,
    this.status,
    this.outOrderNo,
    this.vipTime,
    this.vipTimeStamp,
    this.unitPrice,
    this.unitTime,
    this.money,
    this.dayTopMoney,
    this.totalTopMoney,
    this.freeTime,
    this.createTimeStamp,
    this.updateTime,
    this.orderUseMinutes,
    this.platformId,
    this.userId,
    this.statusGroup,
    this.deposit,
    this.amount,
    this.totalAmount,
    this.discountAmount,
    this.accountingMinutes,
    this.displayAddr,
    this.displayAddrBack,
    this.shopAvatarUrl,
    this.shopBackAvatarUrl,
  });

  OrderResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        stampStart = json['stampStart'],
        stampEnd = json['stampEnd'],
        timeStartDate = json['timeStartDate'] as String?,
        timeStartTime = json['timeStartTime'] as String?,
        timeEndDate = json['timeEndDate'] as String?,
        timeEndTime = json['timeEndTime'] as String?,
        equipmentId = json['equipmentId'],
        equipmentSn = json['equipmentSn'] as String?,
        equipmentCode = json['equipmentCode'] as String?,
        batterySn = json['batterySn'] as String?,
        batteryPipeNum = json['batteryPipeNum'] as String?,
        rentEe = json['rentEe'] as String?,
        backEe = json['backEe'] as String?,
        shopId = json['shopId'],
        shopIdBack = json['shopIdBack'],
        shopName = json['shopName'] as String?,
        shopNameBack = json['shopNameBack'] as String?,
        shopTel = json['shopTel'] as String?,
        shopAddr = json['shopAddr'] as String?,
        visitorId = json['visitorId'],
        visitorName = json['visitorName'] as String?,
        visitorTel = json['visitorTel'] as String?,
        visitorOpenid = json['visitorOpenid'] as String?,
        backBatteryStatus = json['backBatteryStatus'] as String?,
        type = json['type'] as String?,
        price = json['price'],
        status = json['status'] as String?,
        outOrderNo = json['outOrderNo'] as String?,
        vipTime = json['vipTime'],
        vipTimeStamp = json['vipTimeStamp'],
        unitPrice = json['unitPrice'],
        unitTime = json['unitTime'],
        money = json['money'],
        dayTopMoney = json['dayTopMoney'],
        totalTopMoney = json['totalTopMoney'],
        freeTime = json['freeTime'],
        createTimeStamp = json['createTimeStamp'],
        updateTime = json['updateTime'] as String?,
        orderUseMinutes = json['orderUseMinutes'],
        platformId = json['platformId'],
        userId = json['userId'],
        statusGroup = json['statusGroup'] as String?,
        deposit = json['deposit'],
        amount = json['amount'],
        totalAmount = json['totalAmount'],
        discountAmount = json['discountAmount'],
        accountingMinutes = json['accountingMinutes'],
        displayAddr = json['display_addr'] as String?,
        displayAddrBack = json['display_addr_back'] as String?,
        shopAvatarUrl = json['shop_avatar_url'] as String?,
        shopBackAvatarUrl = json['shop_back_avatar_url'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'stampStart': stampStart,
        'stampEnd': stampEnd,
        'timeStartDate': timeStartDate,
        'timeStartTime': timeStartTime,
        'timeEndDate': timeEndDate,
        'timeEndTime': timeEndTime,
        'equipmentId': equipmentId,
        'equipmentSn': equipmentSn,
        'equipmentCode': equipmentCode,
        'batterySn': batterySn,
        'batteryPipeNum': batteryPipeNum,
        'rentEe': rentEe,
        'backEe': backEe,
        'shopId': shopId,
        'shopIdBack': shopIdBack,
        'shopName': shopName,
        'shopNameBack': shopNameBack,
        'shopTel': shopTel,
        'shopAddr': shopAddr,
        'visitorId': visitorId,
        'visitorName': visitorName,
        'visitorTel': visitorTel,
        'visitorOpenid': visitorOpenid,
        'backBatteryStatus': backBatteryStatus,
        'type': type,
        'price': price,
        'status': status,
        'outOrderNo': outOrderNo,
        'vipTime': vipTime,
        'vipTimeStamp': vipTimeStamp,
        'unitPrice': unitPrice,
        'unitTime': unitTime,
        'money': money,
        'dayTopMoney': dayTopMoney,
        'totalTopMoney': totalTopMoney,
        'freeTime': freeTime,
        'createTimeStamp': createTimeStamp,
        'updateTime': updateTime,
        'orderUseMinutes': orderUseMinutes,
        'platformId': platformId,
        'userId': userId,
        'statusGroup': statusGroup,
        'deposit': deposit,
        'amount': amount,
        'totalAmount': totalAmount,
        'discountAmount': discountAmount,
        'accountingMinutes': accountingMinutes,
        'display_addr': displayAddr,
        'display_addr_back': displayAddrBack,
        'shop_avatar_url': shopAvatarUrl,
        'shop_back_avatar_url': shopBackAvatarUrl
      };
}

extension OrderExt on OrderResponse {
  String get getImageOrder {
    switch (statusGroup) {
      case 'Ignore':
        return AppAssets.imgItemHistoryRentalBatteryDeny;

      case 'Completed':
        return AppAssets.imgItemHistoryRentalBatterySuccess;

      case 'Underway':
        return AppAssets.imgItemHistoryRentalBatteryUnderway;

      default:
        return '';
    }
  }

  String get getTitleOrder {
    switch (statusGroup) {
      case 'Ignore':
        return LocaleKeys.cancel.tr();

      case 'Completed':
        return LocaleKeys.complete.tr();

      case 'Underway':
        return LocaleKeys.rentaling.tr();

      default:
        return '';
    }
  }

  Color get getColorOrder {
    switch (statusGroup) {
      case 'Ignore':
        return AppColors.colorEC222D;

      case 'Completed':
        return AppColors.color34A853;

      case 'Underway':
        return AppColors.colorFFCB08;

      default:
        return AppColors.colorFFCB08;
    }
  }

  String? get getServiceUsageFee => price != null
      ? '${FormatUtils().formatNumberWithCommas(price).toString()}đ'
      : '0đ';

  String? get getDateTimeRental {
    if (timeEndTime != null) {
      return '$timeStartTime - ${FormatUtils().displayDate2(
        date: timeStartDate,
        typeFormat: 'dd/MM/yyy',
      )}';
    }
    return '';
  }

  String? get getDateTimePay {
    if (timeEndTime != null) {
      return '$timeEndTime - ${FormatUtils().displayDate2(
        date: timeEndDate,
        typeFormat: 'dd/MM/yyy',
      )}';
    }
    return '';
  }

  String? get caculatorTimeUserService {
    if (timeStartDate != null) {
      return FormatUtils().calculateTimeDifferenceAndFormat(
        startDate: timeStartDate,
        startTime: timeStartTime,
        endDate: timeEndDate,
        endTime: timeEndTime,
      );
    }
    return '';
  }

  String? get getStartDateRental {
    if (timeStartDate != null) {
      return FormatUtils()
          .displayDate2(date: timeStartDate, typeFormat: 'dd-MM-yyyy');
    }
    return '';
  }
}
