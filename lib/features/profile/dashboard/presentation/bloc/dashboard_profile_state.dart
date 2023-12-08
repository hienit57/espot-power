part of 'dashboard_profile_cubit.dart';

class DashboardProfileState extends Equatable {
  final RequestStatus? onGetUserProfile;

  final UserProfileResponse? userProfileResponse;

  const DashboardProfileState({
    this.onGetUserProfile,
    this.userProfileResponse,
  });

  DashboardProfileState copyWith({
    RequestStatus? onGetUserProfile,
    UserProfileResponse? userProfileResponse,
  }) {
    return DashboardProfileState(
      onGetUserProfile: onGetUserProfile ?? this.onGetUserProfile,
      userProfileResponse: userProfileResponse ?? this.userProfileResponse,
    );
  }

  @override
  List<Object?> get props => [
        onGetUserProfile,
        userProfileResponse,
      ];
}
