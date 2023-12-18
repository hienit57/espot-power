import 'package:espot_power/core/index.dart';

abstract class ScanDatasources {
  Future<BaseResponseWithObj> checkChargingStation(String? qrCode);
}
