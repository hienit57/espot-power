import 'package:espot_power/core/index.dart';

abstract class VoucherDatasources {
  Future<BaseResponseWithObj> applyVoucher(String? value);
}
