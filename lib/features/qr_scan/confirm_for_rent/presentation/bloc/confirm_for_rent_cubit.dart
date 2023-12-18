import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/utils/index.dart';

part 'confirm_for_rent_state.dart';

class ConfirmForRentCubit extends Cubit<ConfirmForRentState>
    with LoadingMixin, ToastMixin {
  ConfirmForRentCubit() : super(const ConfirmForRentState());

  final _datasource = GetIt.instance<ConfirmForRentDatasourcesImpl>();

  void initData() {
    emit(state.copyWith(msgCreateOrder: ''));
  }

  Future<void> createOrder(String? qrCode) async {
    emit(state.copyWith(onCreateOrder: RequestStatus.loading));
    final calculateRemainingAmount = FormatUtils()
        .calculateRemainingAmount(state.userProfileResponse?.money, 50000);

    if (calculateRemainingAmount < 0) {
      try {
        await _datasource.createOrder(qrCode).then((response) async {
          if (response.ok == false) {
            emit(
              state.copyWith(
                msgCreateOrder: response.msg,
                onCreateOrder: RequestStatus.failure,
              ),
            );
          } else {
            final createOrderResponse =
                CreateOrderResponse.fromJson(response.obj);
            emit(
              state.copyWith(
                msgCreateOrder: '',
                createOrderResponse: createOrderResponse,
                onCreateOrder: RequestStatus.success,
              ),
            );
          }
        });
      } catch (e) {
        emit(state.copyWith(onCreateOrder: RequestStatus.failure));
      }
    } else {
      emit(state.copyWith(
        onCreateOrder: RequestStatus.failure,
        msgCreateOrder: LocaleKeys.balance_not_enough.tr(),
      ));
    }
  }

  Future<void> verifyPayBalance() async {
    emit(state.copyWith(onPayBalance: RequestStatus.loading));

    try {
      await _datasource
          .verifyPayingBalance(state.createOrderResponse?.orderNo)
          .then((response) async {
        if (response.ok == false) {
          emit(
            state.copyWith(
              onPayBalance: RequestStatus.failure,
            ),
          );
        } else {
          emit(
            state.copyWith(
              onPayBalance: RequestStatus.success,
            ),
          );
        }
      });
    } catch (e) {
      emit(state.copyWith(onPayBalance: RequestStatus.failure));
    }
  }

  void emitUserProfileReponse(UserProfileResponse? value) {
    emit(state.copyWith(userProfileResponse: value));
  }
}
