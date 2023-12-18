import 'dart:async';

import 'package:espot_power/features/index.dart';
import 'package:espot_power/models/index.dart';

part 'dashboard_order_state.dart';

class DashboardOrderCubit extends Cubit<DashboardOrderState>
    with LoadingMixin, ToastMixin {
  DashboardOrderCubit() : super(const DashboardOrderState());

  final _datasource = GetIt.instance<DashboardOrderDatasourcesImpl>();

  void initData() {
    emit(state.copyWith(
      skip: 0,
      isFirstLoad: false,
    ));
    getOrders();
  }

  List<OrderResponse> listOrderDisplay = [];

  Future<void> getOrders() async {
    emit(state.copyWith(onGetOrders: RequestStatus.loading));
    try {
      int skip = state.skip ?? 0;
      int totalPage = state.totalPage ?? 0;

      GetOrdersModelRequest dataRequest;

      if (totalPage > skip && totalPage != 1) {
        skip++;

        dataRequest = GetOrdersModelRequest(
          skip: skip,
        );

        await _datasource.getOrders(dataRequest).then((response) async {
          if (response.obj != null) {
            listOrderDisplay = state.ordersReponseDisplay ?? [];
            listOrderDisplay.addAll(response.obj as List<OrderResponse>);

            emit(
              state.copyWith(
                skip: skip,
                totalPage: response.totalPage,
                ordersReponse: response.obj as List<OrderResponse>,
                onGetOrders: RequestStatus.success,
                ordersReponseDisplay: listOrderDisplay,
              ),
            );
          } else {
            emit(
              state.copyWith(
                skip: skip,
                ordersReponseDisplay: listOrderDisplay,
                onGetOrders: RequestStatus.success,
              ),
            );
          }
        });
      }
      if (state.isFirstLoad == false) {
        await _datasource
            .getOrders(GetOrdersModelRequest(skip: 1))
            .then((response) async {
          if (response.obj != null) {
            emit(
              state.copyWith(
                skip: 1,
                totalPage: response.totalPage,
                isFirstLoad: true,
                ordersReponse: response.obj as List<OrderResponse>,
                ordersReponseDisplay: response.obj as List<OrderResponse>,
                onGetOrders: RequestStatus.success,
              ),
            );
          } else {
            emit(
              state.copyWith(
                isFirstLoad: false,
                ordersReponseDisplay: [],
                onGetOrders: RequestStatus.success,
              ),
            );
          }
        });
      }
    } catch (e) {
      emit(state.copyWith(onGetOrders: RequestStatus.failure));
    }
  }

  void emitOrderSelected(OrderResponse? value) {
    emit(state.copyWith(orderSelected: value));
  }

  late Timer timeCounting;

  void increaseValueEverySecond(int initialValue) {
    int value = initialValue;

    // Tạo một Timer chạy mỗi giây
    timeCounting = Timer.periodic(Duration(seconds: 1), (timer) {
      value++; // Tăng giá trị lên 1 mỗi giây
      emit(state.copyWith(countTime: value));

      // Điều kiện dừng Timer (ví dụ: dừng sau khi giá trị đạt 10)
      //cancelTimeCounting(timer);
    });
  }

  void cancelTimeCounting() {
    timeCounting.cancel();
  }
}
