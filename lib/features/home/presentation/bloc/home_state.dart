part of 'home_cubit.dart';

class HomeState extends Equatable {
  final RequestStatus? onGetView;

  final AllScreenHome? screenForHome;
  final int? indexSelectTab;

  const HomeState({
    this.onGetView,
    this.screenForHome,
    this.indexSelectTab,
  });

  HomeState copyWith({
    RequestStatus? onGetView,
    AllScreenHome? screenForHome,
    int? indexSelectTab,
  }) {
    return HomeState(
      onGetView: onGetView ?? this.onGetView,
      screenForHome: screenForHome ?? this.screenForHome,
      indexSelectTab: indexSelectTab ?? this.indexSelectTab,
    );
  }

  @override
  List<Object?> get props => [
        onGetView,
        screenForHome,
        indexSelectTab,
      ];
}
