import 'package:espot_power/features/index.dart';
import 'package:espot_power/models/index.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState>
    with LoadingMixin, ToastMixin {
  NotificationCubit() : super(const NotificationState());

  final _datasource = GetIt.instance<NotificationDatasourcesImpl>();

  void initData() {
    emit(state.copyWith(
      skip: 0,
      indexTab: 0,
      isFirstLoad: false,
    ));
    getNotifications();
  }

  List<NotificationResponse> listNotificationDisplay = [];

  Future<void> getNotifications() async {
    emit(state.copyWith(onGetNotification: RequestStatus.loading));

    try {
      int skip = state.skip ?? 0;
      int totalPage = state.totalPage ?? 0;
      NotificationModelRequest dataRequest;

      if (totalPage > skip && totalPage != 1) {
        skip++;

        dataRequest = NotificationModelRequest(
          typeNotification: getTypeRequest(state.indexTab ?? 0),
          skip: skip,
        );

        await _datasource
            .getListNotification(dataRequest)
            .then((response) async {
          if (response.obj != null) {
            listNotificationDisplay = state.notificationsReponseDisplay ?? [];
            listNotificationDisplay
                .addAll(response.obj as List<NotificationResponse>);

            emit(
              state.copyWith(
                skip: skip,
                totalPage: response.totalPage,
                notificationsReponse:
                    response.obj as List<NotificationResponse>,
                notificationsReponseDisplay: listNotificationDisplay,
                onGetNotification: RequestStatus.success,
              ),
            );
          } else {
            emit(
              state.copyWith(
                notificationsReponse: [],
                onGetNotification: RequestStatus.success,
              ),
            );
          }
        });
      } else if (state.isFirstLoad == false) {
        await _datasource
            .getListNotification(NotificationModelRequest(
          typeNotification: getTypeRequest(state.indexTab ?? 0),
          skip: skip,
        ))
            .then((response) async {
          if (response.obj != null) {
            emit(
              state.copyWith(
                skip: 1,
                totalPage: response.totalPage,
                notificationsReponse:
                    response.obj as List<NotificationResponse>,
                notificationsReponseDisplay:
                    response.obj as List<NotificationResponse>,
                onGetNotification: RequestStatus.success,
                isFirstLoad: true,
              ),
            );
          } else {
            emit(
              state.copyWith(
                totalPage: 0,
                skip: 0,
                isFirstLoad: false,
                notificationsReponse: [],
                onGetNotification: RequestStatus.success,
              ),
            );
          }
        });
      } else {
        emit(state.copyWith(
          notificationsReponseDisplay: state.notificationsReponseDisplay,
          onGetNotification: RequestStatus.success,
        ));
      }
    } catch (e) {
      emit(state.copyWith(onGetNotification: RequestStatus.failure));
    }
  }

  String getTypeRequest(int value) {
    switch (value) {
      case 0:
        return '';
      case 1:
        return 'BALANCE';
      case 2:
        return 'ORDER';
      default:
        return '';
    }
  }

  void emitSelectTab(int value) {
    emit(state.copyWith(
      indexTab: value,
      skip: 0,
      totalPage: 0,
      isFirstLoad: false,
      notificationsReponseDisplay: [],
    ));
    getNotifications();
  }
}
