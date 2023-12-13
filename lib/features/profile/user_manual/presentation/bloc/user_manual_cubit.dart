import 'package:espot_power/features/index.dart';
import 'package:espot_power/models/index.dart';

part 'user_manual_state.dart';

class UserManualCubit extends Cubit<UserManualState>
    with LoadingMixin, ToastMixin {
  UserManualCubit() : super(const UserManualState());

  final _datasource = GetIt.instance<UserManualDatasourcesImpl>();

  Future<void> getUserManual({int? skip, int? take}) async {
    emit(state.copyWith(onGetUserManual: RequestStatus.loading));

    try {
      final dataRequest = UserManualModelRequest(
        type: getTypeRequest(state.indexSelectTab ?? 0),
        take: take,
        skip: skip,
      );
      await _datasource.getUserManual(dataRequest).then((response) async {
        if (response.obj != null) {
          emit(
            state.copyWith(
              listManualResponse: response.obj as List<ManualResponse>,
              listManualDisplay: response.obj as List<ManualResponse>,
              onGetUserManual: RequestStatus.success,
            ),
          );
        } else {
          emit(
            state.copyWith(
              listManualResponse: [],
              listManualDisplay: [],
              onGetUserManual: RequestStatus.success,
            ),
          );
        }
      });
    } catch (e) {
      emit(state.copyWith(onGetUserManual: RequestStatus.failure));
    }
  }

  String getTypeRequest(int value) {
    switch (value) {
      case 0:
        return 'rent and pay';
      case 1:
        return 'payment';
      case 2:
        return 'qa';
      default:
        return 'rent and pay';
    }
  }

  void emitSelectTab(int value) {
    emit(state.copyWith(indexSelectTab: value));
  }

  void emitGuildId(String? value) {
    emit(state.copyWith(guideId: value));
  }

  void checkPayBattery(String value) {
    switch (value) {
      case 'rent':
        final listRentBattery = state.listManualResponse
            ?.where(
              (element) => element.tag == 'rent',
            )
            .toList();
        emit(state.copyWith(
            isPayBattery: false, listManualDisplay: listRentBattery));
        break;
      case 'pay':
        final listPayBattery = state.listManualResponse
            ?.where(
              (element) => element.tag == 'pay',
            )
            .toList();
        emit(state.copyWith(
            isPayBattery: true, listManualDisplay: listPayBattery));
        break;
      default:
        break;
    }
  }
}
