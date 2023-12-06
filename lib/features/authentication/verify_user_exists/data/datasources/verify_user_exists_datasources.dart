import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

abstract class VerifyUserDatasources {
  Future<BaseRequestResponse> verifyUserExist(
      VerifyUserExistModelRequest dataRequest);
  // Future<BaseRequestListResponseWithPagination<PatientRecordModelResponse>>
  //     getListInvoicing({int? skip, int? forceAll}) async {
  //   Map<String, dynamic> body = {
  //     "Filter": {"Keyword": "Dental"},
  //     "Pagination": {
  //       "Position": skip,
  //       "Take": limitItemPagination,
  //       "ForceAll": 0
  //     }
  //   };
  //   String jsonBody = json.encode(body);
  //   final res = await ApiService().request(ExampleRequest(jsonBody));

  //   final response = BaseRequestListResponseWithPagination<
  //       PatientRecordModelResponse>.fromJson(
  //     res,
  //     (json) =>
  //         PatientRecordModelResponse.fromJson(json as Map<String, dynamic>),
  //   );

  //   return response;
  // }
}
