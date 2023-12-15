import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/models/index.dart';

part 'select_bank_account_state.dart';

class SelectBankAccountCubit extends Cubit<SelectBankAccountState>
    with LoadingMixin, ToastMixin {
  SelectBankAccountCubit() : super(const SelectBankAccountState());

  final _datasource = GetIt.instance<SelectBankAccountDatasourcesImpl>();

  void initData() {
    emit(state.copyWith(msgSelectBank: '', yourBankSelected: null));
  }

  Future<void> getListYourBank() async {
    emit(state.copyWith(onGetListBank: RequestStatus.loading));

    try {
      await _datasource.getListYourBank().then((response) async {
        final dataResponse = (response.obj as List<dynamic>?)
            ?.map((item) =>
                BankInformationResponse.fromJson(item as Map<String, dynamic>))
            .toList();

        emit(
          state.copyWith(
            listYourBank: dataResponse,
            onGetListBank: RequestStatus.success,
          ),
        );
      });
    } catch (e) {
      emit(state.copyWith(onGetListBank: RequestStatus.failure));
    }
  }

  void emitYourBankSelected(BankInformationResponse? value) {
    emit(state.copyWith(yourBankSelected: value, msgSelectBank: ''));
  }

  void checkSelectYourBankAccount() {
    if (state.yourBankSelected != null) {
      NavigatorExt.push(
        AppContext.navigatorKey.currentContext!,
        InputAmountWithdrawPage(
          bankInformationResponse: state.yourBankSelected,
        ),
      );
    } else {
      emit(state.copyWith(
          msgSelectBank:
              LocaleKeys.please_select_account_to_make_transaction.tr()));
    }
  }
}
