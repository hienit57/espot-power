import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/utils/index.dart';
import 'package:flutter/material.dart';

part 'verify_user_exists_state.dart';

class VerifyUserExistsCubit extends Cubit<VerifyUserExistsState>
    with LoadingMixin, ToastMixin {
  VerifyUserExistsCubit() : super(const VerifyUserExistsState());

  TextEditingController? phoneController = TextEditingController();

  final _datasource = GetIt.instance<VerifyUserDatasourcesImpl>();

  Future<void> verifyUserExist() async {
    emit(state.copyWith(onVerifyUserExists: RequestStatus.loading));

    try {
      if (Validation.validationPhone(phoneController?.text ?? '') == false) {
        emit(
          state.copyWith(
            msgVerifyUserExists: LocaleKeys.phone_not_correct_format.tr(),
            onVerifyUserExists: RequestStatus.failure,
          ),
        );
      } else {
        final dataRequest = VerifyUserExistModelRequest(
            phoneNumber: phoneController?.text ?? '');
        await _datasource.verifyUserExist(dataRequest).then((response) async {
          if (response.code != 15) {
            emit(
              state.copyWith(
                msgVerifyUserExists: response.msg,
                onVerifyUserExists: RequestStatus.failure,
              ),
            );
          } else {
            emit(
              state.copyWith(
                msgVerifyUserExists: response.msg,
                onVerifyUserExists: RequestStatus.success,
              ),
            );
          }
        });
      }
    } catch (e) {
      emit(state.copyWith(onVerifyUserExists: RequestStatus.failure));
    }
  }
}
