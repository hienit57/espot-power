import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

class VoucherDatasourcesImpl extends VoucherDatasources {
  @override
  Future<BaseResponseWithObj> applyVoucher(String? value) async {
    Map<String, dynamic> queryParameters = {
      "coupon": value,
    }..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(ApplyVoucherRequest(queryParameters: queryParameters));

    return BaseResponseWithObj.fromJson(res);
  }
}
