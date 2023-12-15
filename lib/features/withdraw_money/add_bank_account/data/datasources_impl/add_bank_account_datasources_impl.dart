import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

class AddBankAccountDatasourcesImpl extends AddBankAccountDatasources {
  @override
  Future<BaseResponseWithObj> getBankList() async {
    Map<String, dynamic> queryParameters = {}
      ..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(GetBankListRequest(queryParameters: queryParameters));

    return BaseResponseWithObj.fromJson(res);
  }

  @override
  Future<BaseResponseWithObj> verifyAddBankAccount(
      AddBankAccountModelRequest dataRequest) async {
    Map<String, dynamic> queryParameters = {
      "account": dataRequest.account,
      "bankCode": dataRequest.bankCode,
    }..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(AddBankAccountRequest(queryParameters: queryParameters));

    return BaseResponseWithObj.fromJson(res);
  }
}
