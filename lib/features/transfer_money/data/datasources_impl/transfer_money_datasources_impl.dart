import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

class TransferMoneyDatasourcesImpl extends TransferMoneyDatasources {
  @override
  Future<BaseResponseWithObj> getInformationReceiver(
      String? phoneNumber) async {
    Map<String, dynamic> queryParameters = {
      "phone": phoneNumber,
    }..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService().request(
        GetInformationReceiverRequest(queryParameters: queryParameters));

    return BaseResponseWithObj.fromJson(res);
  }

  @override
  Future<BaseResponseWithObj> transferMoney(
      TransferMoneyModelRequest dataRequest) async {
    Map<String, dynamic> queryParameters = {
      "amount": dataRequest.amount,
      "phone": dataRequest.phoneNumber,
    }..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(TransferMoneyRequest(queryParameters: queryParameters));

    return BaseResponseWithObj.fromJson(res);
  }
}
