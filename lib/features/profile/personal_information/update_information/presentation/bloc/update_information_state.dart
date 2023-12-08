part of 'update_information_cubit.dart';

class UpdateInformationUserState extends Equatable {
  final RequestStatus? onUpdateInformationUser;
  final String? msgUpdateInformationUser;

  final String? gender;
  final String? address;
  final UserProfileResponse? userProfileResponse;

  const UpdateInformationUserState({
    this.onUpdateInformationUser,
    this.msgUpdateInformationUser,
    this.gender,
    this.address,
    this.userProfileResponse,
  });

  UpdateInformationUserState copyWith({
    RequestStatus? onUpdateInformationUser,
    String? msgUpdateInformationUser,
    String? gender,
    String? address,
    UserProfileResponse? userProfileResponse,
  }) {
    return UpdateInformationUserState(
      onUpdateInformationUser:
          onUpdateInformationUser ?? this.onUpdateInformationUser,
      msgUpdateInformationUser:
          msgUpdateInformationUser ?? this.msgUpdateInformationUser,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      userProfileResponse: userProfileResponse ?? this.userProfileResponse,
    );
  }

  @override
  List<Object?> get props => [
        onUpdateInformationUser,
        msgUpdateInformationUser,
        gender,
        address,
        userProfileResponse,
      ];
}
