part of 'notification_cubit.dart';

class NotificationState extends Equatable {
  final RequestStatus? onGetNotification;

  final int? skip;
  final int? totalPage;
  final List<NotificationResponse>? notificationsReponse;
  final List<NotificationResponse>? notificationsReponseDisplay;

  final int? indexTab;

  const NotificationState({
    this.onGetNotification,
    this.skip,
    this.totalPage,
    this.notificationsReponse,
    this.notificationsReponseDisplay,
    this.indexTab,
  });

  NotificationState copyWith({
    RequestStatus? onGetNotification,
    int? skip,
    int? totalPage,
    List<NotificationResponse>? notificationsReponse,
    List<NotificationResponse>? notificationsReponseDisplay,
    int? indexTab,
  }) {
    return NotificationState(
      onGetNotification: onGetNotification ?? this.onGetNotification,
      skip: skip ?? this.skip,
      totalPage: totalPage ?? this.totalPage,
      notificationsReponse: notificationsReponse ?? this.notificationsReponse,
      notificationsReponseDisplay:
          notificationsReponseDisplay ?? this.notificationsReponseDisplay,
      indexTab: indexTab ?? this.indexTab,
    );
  }

  @override
  List<Object?> get props => [
        onGetNotification,
        skip,
        totalPage,
        notificationsReponse,
        notificationsReponseDisplay,
        indexTab,
      ];
}
