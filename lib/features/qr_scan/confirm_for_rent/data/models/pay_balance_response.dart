class PayBalanceResponse {
  final String? orderNo;
  final String? visitorId;
  final dynamic paymentAmount;
  final dynamic totalAmount;
  final dynamic discountAmount;
  final String? status;
  final String? paymentMethod;

  PayBalanceResponse({
    this.orderNo,
    this.visitorId,
    this.paymentAmount,
    this.totalAmount,
    this.discountAmount,
    this.status,
    this.paymentMethod,
  });

  PayBalanceResponse.fromJson(Map<String, dynamic> json)
      : orderNo = json['orderNo'] as String?,
        visitorId = json['visitorId'] as String?,
        paymentAmount = json['paymentAmount'],
        totalAmount = json['totalAmount'],
        discountAmount = json['discountAmount'],
        status = json['status'] as String?,
        paymentMethod = json['paymentMethod'] as String?;

  Map<String, dynamic> toJson() => {
        'orderNo': orderNo,
        'visitorId': visitorId,
        'paymentAmount': paymentAmount,
        'totalAmount': totalAmount,
        'discountAmount': discountAmount,
        'status': status,
        'paymentMethod': paymentMethod
      };
}
