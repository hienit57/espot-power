part of 'dashboard_order_cubit.dart';

class DashboardOrderState extends Equatable {
  final RequestStatus? onGetOrders;

  final int? skip;
  final int? totalPage;
  final List<OrderResponse>? ordersReponse;
  final List<OrderResponse>? ordersReponseDisplay;

  final OrderResponse? orderSelected;

  const DashboardOrderState({
    this.onGetOrders,
    this.skip,
    this.totalPage,
    this.ordersReponse,
    this.ordersReponseDisplay,
    this.orderSelected,
  });

  DashboardOrderState copyWith({
    RequestStatus? onGetOrders,
    int? skip,
    int? totalPage,
    List<OrderResponse>? ordersReponse,
    List<OrderResponse>? ordersReponseDisplay,
    OrderResponse? orderSelected,
  }) {
    return DashboardOrderState(
      onGetOrders: onGetOrders ?? this.onGetOrders,
      skip: skip ?? this.skip,
      totalPage: totalPage ?? this.totalPage,
      ordersReponse: ordersReponse ?? this.ordersReponse,
      ordersReponseDisplay: ordersReponseDisplay ?? this.ordersReponseDisplay,
      orderSelected: orderSelected ?? this.orderSelected,
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
      ];
}
