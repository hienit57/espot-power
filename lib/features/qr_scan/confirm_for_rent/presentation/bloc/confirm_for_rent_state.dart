part of 'confirm_for_rent_cubit.dart';

class ConfirmForRentState extends Equatable {
  final RequestStatus? onCreateOrder;
  final RequestStatus? onPayBalance;

  final CreateOrderResponse? createOrderResponse;

  final String? msgCreateOrder;

  final UserProfileResponse? userProfileResponse;

  const ConfirmForRentState({
    this.onCreateOrder,
    this.onPayBalance,
    this.createOrderResponse,
    this.msgCreateOrder,
    this.userProfileResponse,
  });

  ConfirmForRentState copyWith({
    RequestStatus? onCreateOrder,
    RequestStatus? onPayBalance,
    CreateOrderResponse? createOrderResponse,
    String? msgCreateOrder,
    UserProfileResponse? userProfileResponse,
  }) {
    return ConfirmForRentState(
      onCreateOrder: onCreateOrder ?? this.onCreateOrder,
      onPayBalance: onPayBalance ?? this.onPayBalance,
      createOrderResponse: createOrderResponse ?? this.createOrderResponse,
      msgCreateOrder: msgCreateOrder ?? this.msgCreateOrder,
      userProfileResponse: userProfileResponse ?? this.userProfileResponse,
    );
  }

  @override
  List<Object?> get props => [
        onCreateOrder,
        onPayBalance,
        createOrderResponse,
        msgCreateOrder,
        userProfileResponse,
      ];
}
