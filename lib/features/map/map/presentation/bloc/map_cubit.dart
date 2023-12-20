import 'dart:async';

import 'package:espot_power/features/index.dart';
import 'package:espot_power/models/index.dart';
import 'package:flutter/material.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> with LoadingMixin, ToastMixin {
  MapCubit() : super(const MapState());

  late StreamController<StatusSliding> slidingController;
  double containerHeight = 172.0;
  final searchController = TextEditingController();
  Timer? _debounceTimer;

  final _datasource = GetIt.instance<MapDatasourcesImpl>();

  void initData() {
    searchController.text = '';

    emit(state.copyWith(listLocationSearchResponse: []));
  }

  Future<void> paramSearchRequest() async {
    final dataRequest = SearchLocationModelRequest(
      keyWord: searchController.text,
      pageNo: 1,
      pageSize: 20,
      lat: '21.053356120970047',
      lon: '105.80388469999998',
    );
    emit(state.copyWith(paramSearchRequest: dataRequest));
  }

  Future<void> onSearchLocation() async {
    emit(state.copyWith(onSearchLocation: RequestStatus.loading));

    try {
      await paramSearchRequest();
      await _datasource
          .searchLocationNearMe(state.paramSearchRequest)
          .then((response) async {
        emit(
          state.copyWith(
            listLocationSearchResponse: response.obj as List<LocationResponse>,
            onSearchLocation: RequestStatus.success,
          ),
        );
      });
    } catch (e) {
      emit(state.copyWith(onSearchLocation: RequestStatus.failure));
    }
  }

  void onSearchChanged() {
    if (_debounceTimer?.isActive ?? false) _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      onSearchLocation();
    });
  }
}
