import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

abstract class MapDatasources {
  Future<BaseResponseWithObj> listLocationMap(
      GetListLocationMapModelRequest? dataRequest);

  Future<BaseResponseWithPagination> searchLocationNearMe(
      SearchLocationModelRequest? dataRequest);
}
