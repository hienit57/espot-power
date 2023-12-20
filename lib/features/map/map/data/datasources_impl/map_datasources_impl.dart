import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/models/index.dart';

class MapDatasourcesImpl extends MapDatasources {
  @override
  Future<BaseResponseWithPagination> searchLocationNearMe(
      SearchLocationModelRequest? dataRequest) async {
    Map<String, dynamic> queryParameters = {
      "keyword": dataRequest?.keyWord,
      "lat": dataRequest?.lat ?? '21.053356120970047',
      "lon": dataRequest?.lon ?? '105.80388469999998',
      "pageNo": dataRequest?.pageNo,
      "pageSize": dataRequest?.pageSize ?? 20,
    }..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(SearchLocationRequest(queryParameters: queryParameters));

    return BaseResponseWithPagination<LocationResponse>.fromJson(
        res, (json) => LocationResponse.fromJson(json as Map<String, dynamic>));
  }

  @override
  Future<BaseResponseWithObj> listLocationMap(
      GetListLocationMapModelRequest? dataRequest) async {
    Map<String, dynamic> queryParameters = {
      "distance": dataRequest?.distance,
      "limit": 100,
      "lat": dataRequest?.lat,
      "lon": dataRequest?.lon,
    }..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(GetListLocationMapRequest(queryParameters: queryParameters));

    return BaseResponseWithObj.fromJson(res);
  }
}
