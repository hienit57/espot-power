part of 'home_cubit.dart';

class HomeState extends Equatable {
  final RequestStatus? onGetView;
  const HomeState({this.onGetView});

  HomeState copyWith({
    RequestStatus? onGetView,
  }) {
    return HomeState(
      onGetView: onGetView ?? this.onGetView,
    );
  }

  @override
  List<Object?> get props => [
        onGetView,
      ];
}
