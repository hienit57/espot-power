part of 'example_cubit.dart';

class ExampleState extends Equatable {
  final RequestStatus? onGetView;
  const ExampleState({this.onGetView});

  ExampleState copyWith({
    RequestStatus? onGetView,
  }) {
    return ExampleState(
      onGetView: onGetView ?? this.onGetView,
    );
  }

  @override
  List<Object?> get props => [
        onGetView,
      ];
}
