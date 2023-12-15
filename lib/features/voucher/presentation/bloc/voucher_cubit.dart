import 'package:espot_power/features/index.dart';
import 'package:espot_power/models/index.dart';
import 'package:flutter/widgets.dart';

part 'voucher_state.dart';

class VoucherCubit extends Cubit<VoucherState> with LoadingMixin, ToastMixin {
  VoucherCubit() : super(const VoucherState());

  final _datasource = GetIt.instance<VoucherDatasourcesImpl>();

  final voucherController = TextEditingController();

  void initState() {
    voucherController.text = '';
    emit(state.copyWith(
      msgApplyVoucher: '',
    ));
  }

  void resetState() {
    emit(state.copyWith(
      msgApplyVoucher: '',
      onApplyVoucher: RequestStatus.initial,
    ));
  }

  Future<void> applyVoucher() async {
    emit(state.copyWith(onApplyVoucher: RequestStatus.loading));

    try {
      await _datasource
          .applyVoucher(voucherController.text)
          .then((response) async {
        if (response.ok == false) {
          emit(
            state.copyWith(
              msgApplyVoucher: response.msg,
              onApplyVoucher: RequestStatus.failure,
            ),
          );
        } else {
          final dataResponse = VoucherResponse.fromJson(response.obj);
          emit(
            state.copyWith(
              voucherResponse: dataResponse,
              msgApplyVoucher: '',
              onApplyVoucher: RequestStatus.success,
            ),
          );
        }
      });
    } catch (e) {
      emit(state.copyWith(onApplyVoucher: RequestStatus.failure));
    }
  }
}
