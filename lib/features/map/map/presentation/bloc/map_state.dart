part of 'map_cubit.dart';

class MapState extends Equatable {
  final RequestStatus? onGetListLocationMap;
  final List<LocationResponse>? listLocationMapResponse;

  final GetListLocationMapModelRequest? paramGetListLocationMapRequest;

  final List<LocationResponse>? listLocationSearchResponse;

  final List<Marker>? listMaker;
  final LocationResponse? markerSelected;

  final RequestFocusLocation? onRequestFocusLocation;
  final userLocation.LocationData? currentLocationUser;

  const MapState({
    this.onGetListLocationMap,
    this.listLocationMapResponse,
    this.paramGetListLocationMapRequest,
    this.listLocationSearchResponse,
    this.listMaker,
    this.markerSelected,
    this.onRequestFocusLocation,
    this.currentLocationUser,
  });

  MapState copyWith({
    RequestStatus? onSearchLocation,
    GetListLocationMapModelRequest? paramGetListLocationMapRequest,
    List<LocationResponse>? listLocationSearchResponse,
    RequestStatus? onGetListLocationMap,
    List<LocationResponse>? listLocationMapResponse,
    List<Marker>? listMaker,
    LocationResponse? markerSelected,
    RequestFocusLocation? onRequestFocusLocation,
    userLocation.LocationData? currentLocationUser,
  }) {
    return MapState(
      onGetListLocationMap: onGetListLocationMap ?? this.onGetListLocationMap,
      listLocationMapResponse:
          listLocationMapResponse ?? this.listLocationMapResponse,
      paramGetListLocationMapRequest:
          paramGetListLocationMapRequest ?? this.paramGetListLocationMapRequest,
      listLocationSearchResponse:
          listLocationSearchResponse ?? this.listLocationSearchResponse,
      listMaker: listMaker ?? this.listMaker,
      markerSelected: markerSelected ?? this.markerSelected,
      onRequestFocusLocation:
          onRequestFocusLocation ?? this.onRequestFocusLocation,
      currentLocationUser: currentLocationUser ?? this.currentLocationUser,
    );
  }

  @override
  List<Object?> get props => [
        onGetListLocationMap,
        listLocationMapResponse,
        paramGetListLocationMapRequest,
        listLocationSearchResponse,
        listMaker,
        markerSelected,
        onRequestFocusLocation,
        currentLocationUser,
      ];
}
