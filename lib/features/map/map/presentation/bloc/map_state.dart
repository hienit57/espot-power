part of 'map_cubit.dart';

class MapState extends Equatable {
  final RequestStatus? onGetView;
  const MapState({this.onGetView});

  MapState copyWith({
    RequestStatus? onGetView,
  }) {
    return MapState(
      onGetView: onGetView ?? this.onGetView,
    );
  }

  @override
  List<Object?> get props => [
        onGetView,
      ];
}
