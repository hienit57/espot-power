import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

class ScanDatasourcesImpl extends ScanDatasources {
  @override
  Future<BaseResponseWithObj> checkChargingStation(String? qrCode) async {
    Map<String, dynamic> queryParameters = {"qrcode": qrCode}
      ..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(ScanRequest(queryParameters: queryParameters));

    return BaseResponseWithObj.fromJson(res);
  }
}
