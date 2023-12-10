import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/profile/feedback/data/index.dart';

class FeedbackDatasourcesImpl extends FeedbackDatasources {
  @override
  Future<BaseResponseWithObj> feedback(FeedbackModelRequest dataRequest) async {
    Map<String, dynamic> queryParameters = {
      "equipmentCode": dataRequest.idDevice,
      "errTitle": dataRequest.typeError,
      "errInfo": dataRequest.informationError,
      "visitorTel": dataRequest.phoneReport,
      "visitorEmail": dataRequest.emailReport,
    }..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(FeedbackRequest(queryParameters: queryParameters));

    return BaseResponseWithObj.fromJson(res);
  }
}
