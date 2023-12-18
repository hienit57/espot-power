class CreateOrderResponse {
  final dynamic orderNo;
  final dynamic deposit;

  CreateOrderResponse({
    this.orderNo,
    this.deposit,
  });

  CreateOrderResponse.fromJson(Map<String, dynamic> json)
      : orderNo = json['orderNo'],
        deposit = json['deposit'];

  Map<String, dynamic> toJson() => {'orderNo': orderNo, 'deposit': deposit};
}
