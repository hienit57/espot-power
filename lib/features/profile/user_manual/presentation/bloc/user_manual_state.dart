part of 'user_manual_cubit.dart';

class UserManualState extends Equatable {
  final RequestStatus? onGetUserManual;

  final List<ManualResponse>? listManualResponse;
  final List<ManualResponse>? listManualDisplay;

  final int? indexSelectTab;

  final String? guideId;
  final bool? isPayBattery;

  const UserManualState({
    this.onGetUserManual,
    this.indexSelectTab,
    this.listManualResponse,
    this.listManualDisplay,
    this.guideId,
    this.isPayBattery,
  });

  UserManualState copyWith({
    RequestStatus? onGetUserManual,
    int? indexSelectTab,
    List<ManualResponse>? listManualResponse,
    List<ManualResponse>? listManualDisplay,
    String? guideId,
    bool? isPayBattery,
  }) {
    return UserManualState(
      onGetUserManual: onGetUserManual ?? this.onGetUserManual,
      indexSelectTab: indexSelectTab ?? this.indexSelectTab,
      listManualResponse: listManualResponse ?? this.listManualResponse,
      listManualDisplay: listManualDisplay ?? this.listManualDisplay,
      guideId: guideId ?? this.guideId,
      isPayBattery: isPayBattery ?? this.isPayBattery,
    );
  }

  @override
  List<Object?> get props => [
        onGetUserManual,
        indexSelectTab,
        listManualResponse,
        listManualDisplay,
        guideId,
        isPayBattery,
      ];
}
