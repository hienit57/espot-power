part of 'verify_login_cubit.dart';

class VerifyLoginState extends Equatable {
  final RequestStatus? onGetView;
  const VerifyLoginState({this.onGetView});

  VerifyLoginState copyWith({
    RequestStatus? onGetView,
  }) {
    return VerifyLoginState(
      onGetView: onGetView ?? this.onGetView,
    );
  }

  @override
  List<Object?> get props => [
        onGetView,
      ];
}
