import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/models/index.dart';

class HistoryTransacltionDatasourcesImpl extends HistoryTransactionDatasources {
  @override
  Future<BaseResponseWithPagination> getHistoryTransaction(
      HistoryTransactionModelRequest dataRequest) async {
    Map<String, dynamic> queryParameters = {
      "pageNo": dataRequest.skip ?? 1,
      "pageSize": dataRequest.take ?? 20,
      "walletType": dataRequest.type ?? 'normal',
    }..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService().request(
        GetHistoryTransactionRequest(queryParameters: queryParameters));

    return BaseResponseWithPagination<TransactionResponse>.fromJson(res,
        (json) => TransactionResponse.fromJson(json as Map<String, dynamic>));
  }
}
