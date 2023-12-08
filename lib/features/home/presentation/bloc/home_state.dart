part of 'home_cubit.dart';

class HomeState extends Equatable {
  final RequestStatus? onGetView;

  final int? indexSelectTab;

  const HomeState({
    this.onGetView,
    this.indexSelectTab,
  });

  HomeState copyWith({
    RequestStatus? onGetView,
    int? indexSelectTab,
  }) {
    return HomeState(
      onGetView: onGetView ?? this.onGetView,
      indexSelectTab: indexSelectTab ?? this.indexSelectTab,
    );
  }

  @override
  List<Object?> get props => [
        onGetView,
        indexSelectTab,
      ];
}
