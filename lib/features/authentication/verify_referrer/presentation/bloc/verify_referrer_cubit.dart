import 'package:espot_power/features/index.dart';
import 'package:espot_power/utils/index.dart';
import 'package:flutter/material.dart';

part 'verify_referrer_state.dart';

class VerifyReferrerCubit extends Cubit<VerifyReferrerState>
    with LoadingMixin, ToastMixin {
  VerifyReferrerCubit() : super(const VerifyReferrerState());

  final phoneController = TextEditingController();

  void checkReferralUser() {
    emit(state.copyWith(isCheckFormatPhone: false));

    if (Validation.validationPhone(phoneController.text) == true) {
      emit(state.copyWith(
        isCheckFormatPhone: true,
      ));
    }
  }
}
