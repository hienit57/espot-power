part of 'map_cubit.dart';

class MapState extends Equatable {
  final RequestStatus? onSearchLocation;
  final SearchLocationModelRequest? paramSearchRequest;

  final List<LocationResponse>? listLocationSearchResponse;

  const MapState({
    this.onSearchLocation,
    this.paramSearchRequest,
    this.listLocationSearchResponse,
  });

  MapState copyWith({
    RequestStatus? onSearchLocation,
    SearchLocationModelRequest? paramSearchRequest,
    List<LocationResponse>? listLocationSearchResponse,
  }) {
    return MapState(
      onSearchLocation: onSearchLocation ?? this.onSearchLocation,
      paramSearchRequest: paramSearchRequest ?? this.paramSearchRequest,
      listLocationSearchResponse:
          listLocationSearchResponse ?? this.listLocationSearchResponse,
    );
  }

  @override
  List<Object?> get props => [
        onSearchLocation,
        paramSearchRequest,
        listLocationSearchResponse,
      ];
}
