import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:flutter/widgets.dart';

part 'contact_for_cooperation_state.dart';

class ContactForCooperationCubit extends Cubit<ContactForCooperationState>
    with LoadingMixin, ToastMixin {
  ContactForCooperationCubit() : super(const ContactForCooperationState());

  final _datasource = GetIt.instance<ContactForCooperationDatasourcesImpl>();

  final companyController = TextEditingController();
  final visitorNameController = TextEditingController();
  final visitorPhoneController = TextEditingController();
  final contentController = TextEditingController();

  void resetState() {
    emit(state.copyWith(
      msgSendContactForCooperation: '',
      onSendContactForCooperation: RequestStatus.initial,
    ));
  }

  Future<void> sendContactForCooperation() async {
    emit(state.copyWith(onSendContactForCooperation: RequestStatus.loading));

    if (companyController.text.isNotEmpty &&
        visitorNameController.text.isNotEmpty &&
        visitorPhoneController.text.isNotEmpty &&
        contentController.text.isNotEmpty) {
      try {
        final dataRequest = ContactForCooperationModelRequest(
          nameCompany: companyController.text,
          visitorName: visitorNameController.text,
          visitorTel: visitorPhoneController.text,
          content: contentController.text,
        );
        await _datasource
            .contactForCooperation(dataRequest)
            .then((response) async {
          if (response.ok == false) {
            emit(
              state.copyWith(
                msgSendContactForCooperation: response.msg,
                onSendContactForCooperation: RequestStatus.failure,
              ),
            );
          } else {
            emit(
              state.copyWith(
                msgSendContactForCooperation: '',
                onSendContactForCooperation: RequestStatus.success,
              ),
            );
          }
        });
      } catch (e) {
        emit(
            state.copyWith(onSendContactForCooperation: RequestStatus.failure));
      }
    } else {
      emit(state.copyWith(
          msgSendContactForCooperation:
              LocaleKeys.please_enter_all_information.tr(),
          onSendContactForCooperation: RequestStatus.failure));
    }
  }
}
