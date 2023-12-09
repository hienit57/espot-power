import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:flutter/widgets.dart';

part 'update_information_state.dart';

class UpdateInformationUserCubit extends Cubit<UpdateInformationUserState>
    with LoadingMixin, ToastMixin {
  UpdateInformationUserCubit() : super(const UpdateInformationUserState());

  List<ProvincesResponse> itemProvinces =
      provinces.map((json) => ProvincesResponse.fromJson(json)).toList();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  void initData(UserProfileResponse? userProfileResponse) {
    nameController.text = userProfileResponse?.name ?? '';
    emailController.text = userProfileResponse?.email ?? '';
    dobController.text = userProfileResponse?.dob ?? '';

    emit(state.copyWith(
      gender: userProfileResponse?.gender,
      address: userProfileResponse?.address,
      userProfileResponse: userProfileResponse,
    ));
  }

  void resetState() {
    emit(state.copyWith(
      onUpdateInformationUser: RequestStatus.initial,
      msgUpdateInformationUser: '',
      gender: '',
      address: '',
    ));
  }

  final _datasource = GetIt.instance<UpdateUserProfileDatasourcesImpl>();

  Future<void> updateInformationUser() async {
    emit(state.copyWith(onUpdateInformationUser: RequestStatus.loading));

    try {
      final dataRequest = UpdateInformationUserModelRequest(
        email: emailController.text,
        dob: dobController.text,
        userName: nameController.text,
        gender: state.gender,
        phoneNum: state.userProfileResponse?.tel,
        address: state.address,
      );
      await _datasource.updateUserProfile(dataRequest).then((response) async {
        if (response.ok == false) {
          emit(
            state.copyWith(
              msgUpdateInformationUser: response.msg,
              onUpdateInformationUser: RequestStatus.failure,
            ),
          );
        } else {
          emit(
            state.copyWith(
              onUpdateInformationUser: RequestStatus.success,
            ),
          );
        }
      });
    } catch (e) {
      emit(state.copyWith(onUpdateInformationUser: RequestStatus.failure));
    }
  }

  void emitGender(String gender) {
    emit(state.copyWith(gender: gender));
  }

  void emitAddress(String address) {
    emit(state.copyWith(address: address));
  }
}
