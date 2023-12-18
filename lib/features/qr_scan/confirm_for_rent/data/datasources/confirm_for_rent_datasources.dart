import 'package:espot_power/core/index.dart';

abstract class ConfirmRentDatasources {
  Future<BaseResponseWithObj> createOrder(String? qrCode);
  Future<BaseResponseWithObj> verifyPayingBalance(String? orderNo);
}
