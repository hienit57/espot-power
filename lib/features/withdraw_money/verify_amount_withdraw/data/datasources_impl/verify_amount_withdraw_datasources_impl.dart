import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

class VerifyAmountWithdrawDatasourcesImpl
    extends VerifyAmountWithdrawDatasources {
  @override
  Future<BaseResponseWithObj> verifyWithdrawMoney(
      VerifyAmountWithdrawModelRequest dataRequest) async {
    Map<String, dynamic> queryParameters = {
      "amount": dataRequest.amount,
      "id": dataRequest.id,
    }..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(VerifyWithdrawMoneyRequest(queryParameters: queryParameters));

    return BaseResponseWithObj.fromJson(res);
  }
}
