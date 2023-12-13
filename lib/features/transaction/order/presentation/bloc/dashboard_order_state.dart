part of 'dashboard_order_cubit.dart';

class DashboardOrderState extends Equatable {
  final RequestStatus? onGetOrders;

  final int? skip;
  final int? totalPage;
  final List<OrderResponse>? ordersReponse;
  final List<OrderResponse>? ordersReponseDisplay;

  final OrderResponse? orderSelected;
  final int? countTime;

  const DashboardOrderState({
    this.onGetOrders,
    this.skip,
    this.totalPage,
    this.ordersReponse,
    this.ordersReponseDisplay,
    this.orderSelected,
    this.countTime,
  });

  DashboardOrderState copyWith({
    RequestStatus? onGetOrders,
    int? skip,
    int? totalPage,
    List<OrderResponse>? ordersReponse,
    List<OrderResponse>? ordersReponseDisplay,
    OrderResponse? orderSelected,
    int? countTime,
  }) {
    return DashboardOrderState(
      onGetOrders: onGetOrders ?? this.onGetOrders,
      skip: skip ?? this.skip,
      totalPage: totalPage ?? this.totalPage,
      ordersReponse: ordersReponse ?? this.ordersReponse,
      ordersReponseDisplay: ordersReponseDisplay ?? this.ordersReponseDisplay,
      orderSelected: orderSelected ?? this.orderSelected,
      countTime: countTime ?? this.countTime,
    );
  }

  @override
  List<Object?> get props => [
        onGetOrders,
        skip,
        totalPage,
        ordersReponse,
        ordersReponseDisplay,
        orderSelected,
        countTime,
      ];
}
