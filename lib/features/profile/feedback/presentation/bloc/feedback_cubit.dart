import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:flutter/material.dart';

part 'feedback_state.dart';

class FeedbackCubit extends Cubit<FeedbackState> with LoadingMixin, ToastMixin {
  FeedbackCubit() : super(const FeedbackState());

  final idDevice = TextEditingController();
  final informationController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  final _datasource = GetIt.instance<FeedbackDatasourcesImpl>();

  void resetData() {
    idDevice.text = '';
    informationController.text = '';
    phoneController.text = '';
    emailController.text = '';
    emit(state.copyWith(
      selectQuestion: '',
      msgSendFeedback: '',
    ));
  }

  void resetState() {
    emit(state.copyWith(
      msgSendFeedback: '',
      onSendFeedback: RequestStatus.initial,
    ));
  }

  Future<void> sendFeedback() async {
    emit(state.copyWith(onSendFeedback: RequestStatus.loading));

    if (idDevice.text.isNotEmpty &&
        (state.selectQuestion?.isNotEmpty ?? false) &&
        informationController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      try {
        final dataRequest = FeedbackModelRequest(
          idDevice: idDevice.text,
          typeError: state.selectQuestion ?? '',
          informationError: informationController.text,
          phoneReport: phoneController.text,
          emailReport: emailController.text,
        );
        await _datasource.feedback(dataRequest).then((response) async {
          if (response.ok == false) {
            emit(
              state.copyWith(
                msgSendFeedback: response.msg,
                onSendFeedback: RequestStatus.failure,
              ),
            );
          } else {
            emit(
              state.copyWith(
                msgSendFeedback: '',
                onSendFeedback: RequestStatus.success,
              ),
            );
          }
        });
      } catch (e) {
        emit(state.copyWith(onSendFeedback: RequestStatus.failure));
      }
    } else {
      emit(state.copyWith(
        msgSendFeedback: LocaleKeys.please_enter_all_information.tr(),
        onSendFeedback: RequestStatus.failure,
      ));
    }
  }

  void emitTypeQuestion(String value) {
    emit(state.copyWith(
      onSendFeedback: RequestStatus.initial,
      msgSendFeedback: '',
      selectQuestion: value,
    ));
  }
}
