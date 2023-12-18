part of 'scan_cubit.dart';

class ScanState extends Equatable {
  final RequestStatus? onGetInformationChargingStation;

  final InformationChargingStationReponse? informationChargingStationReponse;

  final String? qrCode;

  final File? logo;

  const ScanState({
    this.onGetInformationChargingStation,
    this.informationChargingStationReponse,
    this.qrCode,
    this.logo,
  });

  ScanState copyWith({
    RequestStatus? onGetInformationChargingStation,
    InformationChargingStationReponse? informationChargingStationReponse,
    String? qrCode,
    File? logo,
  }) {
    return ScanState(
      onGetInformationChargingStation: onGetInformationChargingStation ??
          this.onGetInformationChargingStation,
      informationChargingStationReponse: informationChargingStationReponse ??
          this.informationChargingStationReponse,
      qrCode: qrCode ?? this.qrCode,
      logo: logo ?? this.logo,
    );
  }

  @override
  List<Object?> get props => [
        onGetInformationChargingStation,
        informationChargingStationReponse,
        qrCode,
        logo,
      ];
}
