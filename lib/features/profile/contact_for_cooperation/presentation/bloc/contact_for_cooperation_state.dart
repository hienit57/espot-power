part of 'contact_for_cooperation_cubit.dart';

class ContactForCooperationState extends Equatable {
  final RequestStatus? onSendContactForCooperation;
  final String? msgSendContactForCooperation;

  const ContactForCooperationState({
    this.onSendContactForCooperation,
    this.msgSendContactForCooperation,
  });

  ContactForCooperationState copyWith({
    RequestStatus? onSendContactForCooperation,
    String? msgSendContactForCooperation,
  }) {
    return ContactForCooperationState(
      onSendContactForCooperation:
          onSendContactForCooperation ?? this.onSendContactForCooperation,
      msgSendContactForCooperation:
          msgSendContactForCooperation ?? this.msgSendContactForCooperation,
    );
  }

  @override
  List<Object?> get props => [
        onSendContactForCooperation,
        msgSendContactForCooperation,
      ];
}
