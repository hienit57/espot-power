import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

class ContactForCooperationDatasourcesImpl
    extends ContactForCooperationDatasources {
  @override
  Future<BaseResponseWithObj> contactForCooperation(
      ContactForCooperationModelRequest dataRequest) async {
    Map<String, dynamic> queryParameters = {
      "company": dataRequest.nameCompany,
      "visitorName": dataRequest.visitorName,
      "visitorTel": dataRequest.visitorTel,
      "info": dataRequest.content,
    }..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService().request(
        ContactForCooperationRequest(queryParameters: queryParameters));

    return BaseResponseWithObj.fromJson(res);
  }
}
