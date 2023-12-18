import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/models/index.dart';

part 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> with LoadingMixin, ToastMixin {
  ScanCubit() : super(const ScanState());

  final _datasource = GetIt.instance<ScanDatasourcesImpl>();

  void initData() {
    emit(state.copyWith(qrCode: ''));
  }

  Future<void> getInformationChargingStation(String? qrCode) async {
    emit(state.copyWith(
      onGetInformationChargingStation: RequestStatus.loading,
    ));
    if (qrCode != state.qrCode) {
      try {
        await _datasource.checkChargingStation(qrCode).then((response) async {
          final dataResponse =
              InformationChargingStationReponse.fromJson(response.obj);
          if (dataResponse.isStatusChargingStation == true &&
              response.ok == true) {
            emit(
              state.copyWith(
                informationChargingStationReponse: dataResponse,
                onGetInformationChargingStation: RequestStatus.success,
              ),
            );
          } else {
            emit(
              state.copyWith(
                informationChargingStationReponse: dataResponse,
                onGetInformationChargingStation: RequestStatus.failure,
              ),
            );
          }
        });
      } catch (e) {
        emit(state.copyWith(
            onGetInformationChargingStation: RequestStatus.failure));
      }
    }
  }

  Future<void> emitQrCode(String value) async {
    if (value != state.qrCode) {
      getInformationChargingStation(value);
      emit(state.copyWith(qrCode: value));
    }
  }

  bool isExistBatteryUnderway(List<OrderResponse> value) {
    final isUnderway =
        value.any((element) => element.statusGroup == 'Underway');

    return isUnderway;
  }
}
