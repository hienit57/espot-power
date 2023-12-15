import 'package:espot_power/utils/index.dart';

class VoucherResponse {
  final int? amount;
  final String? content;
  final bool? status;

  VoucherResponse({
    this.amount,
    this.content,
    this.status,
  });

  VoucherResponse.fromJson(Map<String, dynamic> json)
      : amount = json['amount'] as int?,
        content = json['content'] as String?,
        status = json['status'] as bool?;

  Map<String, dynamic> toJson() =>
      {'amount': amount, 'content': content, 'status': status};
}

extension VoucherExt on VoucherResponse {
  String? get getAmountVoucher => amount != null
      ? '${FormatUtils().formatNumberWithCommas(amount).toString()}đ'
      : '0đ';
}
