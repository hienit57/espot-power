import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

class ConfirmForRentDatasourcesImpl extends ConfirmRentDatasources {
  @override
  Future<BaseResponseWithObj> createOrder(String? qrCode) async {
    Map<String, dynamic> queryParameters = {"qrcode": qrCode}
      ..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(CreateOrderRentRequest(queryParameters: queryParameters));

    return BaseResponseWithObj.fromJson(res);
  }

  @override
  Future<BaseResponseWithObj> verifyPayingBalance(String? orderNo) async {
    Map<String, dynamic> queryParameters = {"orderNo": orderNo}
      ..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(PayBalanceRequest(queryParameters: queryParameters));

    return BaseResponseWithObj.fromJson(res);
  }
}
