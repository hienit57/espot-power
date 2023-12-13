import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/models/order_response.dart';

class DashboardOrderDatasourcesImpl extends DashboardOrderDatasources {
  @override
  Future<BaseResponseWithPagination> getOrders(
      GetOrdersModelRequest dataRequest) async {
    Map<String, dynamic> queryParameters = {
      "pageNo": dataRequest.skip ?? 1,
      "pageSize": dataRequest.take ?? 20,
    }..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(GetOrdersRequest(queryParameters: queryParameters));

    return BaseResponseWithPagination<OrderResponse>.fromJson(
        res, (json) => OrderResponse.fromJson(json as Map<String, dynamic>));
  }
}
