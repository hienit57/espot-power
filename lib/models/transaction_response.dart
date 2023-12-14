import 'package:espot_power/theme/index.dart';
import 'package:espot_power/utils/index.dart';
import 'package:flutter/material.dart';

class TransactionResponse {
  final String? id;
  final int? visitorId;
  final int? amount;
  final String? type;
  final String? orderNo;
  final dynamic tranNo;
  final String? source;
  final String? businessId;
  final String? status;
  final String? createDate;
  final String? updateDate;
  final dynamic createTime;
  final dynamic updateTime;
  final dynamic startStamp;
  final dynamic methodName;
  final dynamic transferReceiver;
  final dynamic transferSender;

  TransactionResponse({
    this.id,
    this.visitorId,
    this.amount,
    this.type,
    this.orderNo,
    this.tranNo,
    this.source,
    this.businessId,
    this.status,
    this.createDate,
    this.updateDate,
    this.createTime,
    this.updateTime,
    this.startStamp,
    this.methodName,
    this.transferReceiver,
    this.transferSender,
  });

  TransactionResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        visitorId = json['visitorId'] as int?,
        amount = json['amount'] as int?,
        type = json['type'] as String?,
        orderNo = json['orderNo'] as String?,
        tranNo = json['tranNo'],
        source = json['source'] as String?,
        businessId = json['businessId'] as String?,
        status = json['status'] as String?,
        createDate = json['createDate'] as String?,
        updateDate = json['updateDate'] as String?,
        createTime = json['createTime'],
        updateTime = json['updateTime'],
        startStamp = json['startStamp'],
        methodName = json['methodName'],
        transferReceiver = json['transferReceiver'],
        transferSender = json['transferSender'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'visitorId': visitorId,
        'amount': amount,
        'type': type,
        'orderNo': orderNo,
        'tranNo': tranNo,
        'source': source,
        'businessId': businessId,
        'status': status,
        'createDate': createDate,
        'updateDate': updateDate,
        'createTime': createTime,
        'updateTime': updateTime,
        'startStamp': startStamp,
        'methodName': methodName,
        'transferReceiver': transferReceiver,
        'transferSender': transferSender
      };
}

extension TransactionExt on TransactionResponse {
  String? get getDateCreateTransaction {
    if (createDate != null) {
      return FormatUtils().displayDate2(
        date: createDate,
        typeFormat: 'dd/MM/yyy',
      );
    }
    return '';
  }

  String? get valueCompare => '$source $status $methodName';

  String? get getImageTransaction {
    switch (valueCompare) {
      ///Todo
      case 'IN_Coupon Paid null':
        return AppAssets.imgHistoryOrderMainAccountCharge;

      case 'IN_RechargeBalance Initial null':
        return AppAssets.imgHistoryOrderMainAccountWithDraw;

      case 'IN_RechargeBalance Canceled Momo':
        return AppAssets.imgHistoryOrderMainAccountCharge;

      case 'OUT_WithdrawBalance Pending null':
        return AppAssets.imgHistoryOrderMainAccountUsedService;

      case 'IN_RechargeBalance Paid Bank':
        return AppAssets.imgHistoryOrderMainAccountCharge;

      case 'IN_RechargeBalance Paid ZaloPay':
        return AppAssets.imgHistoryOrderMainAccountCharge;

      case 'IN_RechargeBalance Initial ZaloPay':
        return AppAssets.imgHistoryOrderMainAccountUsedService;

      case 'OUT_WithdrawBalance Pending Bank':
        return AppAssets.imgHistoryOrderMainAccountUsedService;

      case 'OUT_WithdrawBalance Paid Bank':
        return AppAssets.imgHistoryOrderMainAccountWithDraw;

      case 'OUT_TransferMoney Paid null':
        return AppAssets.imgHistoryOrderMainAccountTransfer;

      case 'IN_TransferMoney Paid null':
        return AppAssets.imgHistoryOrderMainAccountTransfer;

      case 'IN_RechargeBalance Paid null':
        return AppAssets.imgHistoryOrderMainAccountCharge;

      case 'OUT_RentBattery Paid null':
        return AppAssets.imgHistoryOrderMainAccountUsedService;

      case 'OUT_RentBattery Refunded null':
        return AppAssets.imgHistoryOrderMainAccountCharge;

      case 'OUT_HoldBalance Paid null':
        return AppAssets.imgHistoryOrderMainAccountUsedService;

      case 'IN_RechargeBalance Paid OnePay':
        return AppAssets.imgHistoryOrderMainAccountCharge;

      case 'IN_RechargeBalance PayFail OnePay':
        return AppAssets.imgHistoryOrderMainAccountWithDraw;

      case 'IN_RechargeBalance Initial OnePay':
        return AppAssets.imgHistoryOrderMainAccountWithDraw;

      case 'IN_RechargeBalance Paid Momo':
        return AppAssets.imgHistoryOrderMainAccountCharge;

      case 'IN_RechargeBalance Initial Momo':
        return AppAssets.imgHistoryOrderMainAccountUsedService;

      default:
        return '';
    }
  }

  String? get getAmountTransaction => amount != null
      ? '${FormatUtils().formatNumberWithCommas(amount).toString()}đ'
      : '0đ';

  Color? get getColorAmount {
    switch (valueCompare) {
      ///Todo
      case 'IN_Coupon Paid null':
        return AppColors.color34A853;

      case 'IN_RechargeBalance Initial null':
        return AppColors.colorEC222D;

      case 'IN_RechargeBalance Canceled Momo':
        return AppColors.color34A853;

      case 'OUT_WithdrawBalance Pending null':
        return AppColors.colorF9A825;

      case 'IN_RechargeBalance Paid Bank':
        return AppColors.color34A853;

      case 'IN_RechargeBalance Paid ZaloPay':
        return AppColors.color34A853;

      case 'IN_RechargeBalance Initial ZaloPay':
        return AppColors.colorF9A825;

      case 'OUT_WithdrawBalance Pending Bank':
        return AppColors.colorF9A825;

      case 'OUT_WithdrawBalance Paid Bank':
        return AppColors.colorEC222D;

      case 'OUT_TransferMoney Paid null':
        return AppColors.color03A9F4;

      case 'IN_TransferMoney Paid null':
        return AppColors.color03A9F4;

      case 'IN_RechargeBalance Paid null':
        return AppColors.color34A853;

      case 'OUT_RentBattery Paid null':
        return AppColors.colorF9A825;

      case 'OUT_RentBattery Refunded null':
        return AppColors.color34A853;

      case 'OUT_HoldBalance Paid null':
        return AppColors.colorF9A825;

      case 'IN_RechargeBalance Paid OnePay':
        return AppColors.colorF9A825;

      case 'IN_RechargeBalance PayFail OnePay':
        return AppColors.colorEC222D;

      case 'IN_RechargeBalance Initial OnePay':
        return AppColors.colorEC222D;

      case 'IN_RechargeBalance Paid Momo':
        return AppColors.color34A853;

      case 'IN_RechargeBalance Initial Momo':
        return AppColors.color34A853;

      default:
        return AppColors.colorF9A825;
    }
  }

  String? get getTitle {
    switch (checkName) {
      case 0:
        return getTypeTitle;
      case 5:
        return '$getTypeTitle $transferSender';

      case 6:
        return '$getTypeTitle $transferReceiver';
      default:
        return '';
    }
  }

  int? get checkName {
    switch (valueCompare) {
      ///Todo
      case 'IN_Coupon Paid null':
        return 0;

      case 'IN_RechargeBalance Initial null':
        return 0;

      case 'IN_RechargeBalance Canceled Momo':
        return 0;

      case 'OUT_WithdrawBalance Pending null':
        return 0;

      case 'IN_RechargeBalance Paid Bank':
        return 0;

      case 'IN_RechargeBalance Paid ZaloPay':
        return 0;

      case 'IN_RechargeBalance Initial ZaloPay':
        return 0;

      case 'OUT_WithdrawBalance Pending Bank':
        return 0;

      case 'OUT_WithdrawBalance Paid Bank':
        return 0;

      case 'OUT_TransferMoney Paid null':
        return 6;

      case 'IN_TransferMoney Paid null':
        return 5;

      case 'IN_RechargeBalance Paid null':
        return 6;

      case 'OUT_RentBattery Paid null':
        return 0;

      case 'OUT_RentBattery Refunded null':
        return 0;

      case 'OUT_HoldBalance Paid null':
        return 0;

      case 'IN_RechargeBalance Paid OnePay':
        return 0;

      case 'IN_RechargeBalance PayFail OnePay':
        return 0;

      case 'IN_RechargeBalance Initial OnePay':
        return 0;

      case 'IN_RechargeBalance Paid Momo':
        return 0;

      case 'IN_RechargeBalance Initial Momo':
        return 0;

      default:
        return 0;
    }
  }

  String? get getTypeTitle {
    switch (valueCompare) {
      ///Todo
      case 'IN_Coupon Paid null':
        return 'Quà tặng từ eSpot Power';

      case 'IN_RechargeBalance Initial null':
        return 'Nạp tiền thất bại';

      case 'IN_RechargeBalance Canceled Momo':
        return 'Nạp tiền từ ngân hàng';

      case 'OUT_WithdrawBalance Pending null':
        return 'Lệnh rút tiền đang xử lý';

      case 'IN_RechargeBalance Paid Bank':
        return 'Nạp tiền từ ngân hàng';

      case 'IN_RechargeBalance Paid ZaloPay':
        return 'Nạp tiền từ ZaloPay';

      case 'IN_RechargeBalance Initial ZaloPay':
        return 'Nạp tiền từ ZaloPay thất bại';

      case 'OUT_WithdrawBalance Pending Bank':
        return 'Lệnh rút tiền đang xử lý';

      case 'OUT_WithdrawBalance Paid Bank':
        return 'Rút tiền qua ngân hàng';

      case 'OUT_TransferMoney Paid null':
        return 'Chuyển tới';

      case 'IN_TransferMoney Paid null':
        return 'Nhận từ';

      case 'IN_RechargeBalance Paid null':
        return 'Quà tặng từ ESPOT';

      case 'OUT_RentBattery Paid null':
        return 'Sử dụng dịch vụ';

      case 'OUT_RentBattery Refunded null':
        return 'Hoàn lại cọc thuê pin';

      case 'OUT_HoldBalance Paid null':
        return 'Đặt cọc thuê pin';

      case 'IN_RechargeBalance Paid OnePay':
        return 'Nạp tiền qua OnePay';

      case 'IN_RechargeBalance PayFail OnePay':
        return 'Nạp tiền thất bại';

      case 'IN_RechargeBalance Initial OnePay':
        return 'Nạp tiền thất bại';

      case 'IN_RechargeBalance Paid Momo':
        return 'Nạp tiền từ Momo';

      case 'IN_RechargeBalance Initial Momo':
        return 'Nạp tiền từ Momo thất bại';

      case 'IN_RechargeBalance Initial Momo':
        return 'Nạp tiền từ Momo thất bại';

      default:
        return '';
    }
  }
}
