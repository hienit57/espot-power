import 'package:espot_power/features/index.dart';
import 'package:espot_power/models/index.dart';

part 'history_transaction_state.dart';

class HistoryTransactionCubit extends Cubit<HistoryTransactionState>
    with LoadingMixin, ToastMixin {
  HistoryTransactionCubit() : super(const HistoryTransactionState());

  final _datasource = GetIt.instance<HistoryTransacltionDatasourcesImpl>();

  void initData() {
    emitSelectTab(0);
    emit(state.copyWith(
      skip: 0,
      isFirstLoad: false,
    ));
    getHistoryTransactions();
  }

  List<TransactionResponse> listTransactionDisplay = [];

  Future<void> getHistoryTransactions() async {
    emit(state.copyWith(onGetHistoryTransaction: RequestStatus.loading));

    try {
      int skip = state.skip ?? 0;
      int totalPage = state.totalPage ?? 0;
      HistoryTransactionModelRequest dataRequest;

      if (totalPage > skip && totalPage != 1) {
        skip++;

        dataRequest = HistoryTransactionModelRequest(
          type: getTypeRequest(state.indexTab ?? 0),
          skip: skip,
        );

        await _datasource
            .getHistoryTransaction(dataRequest)
            .then((response) async {
          if (response.obj != null) {
            listTransactionDisplay = state.transactionsReponseDisplay ?? [];
            listTransactionDisplay
                .addAll(response.obj as List<TransactionResponse>);

            emit(
              state.copyWith(
                skip: skip,
                totalPage: response.totalPage,
                transactionsReponse: response.obj as List<TransactionResponse>,
                transactionsReponseDisplay: listTransactionDisplay,
                onGetHistoryTransaction: RequestStatus.success,
              ),
            );
          } else {
            emit(
              state.copyWith(
                transactionsReponse: [],
                onGetHistoryTransaction: RequestStatus.success,
              ),
            );
          }
        });
      } else if (state.isFirstLoad == false) {
        await _datasource
            .getHistoryTransaction(HistoryTransactionModelRequest(
          type: getTypeRequest(state.indexTab ?? 0),
          skip: skip,
        ))
            .then((response) async {
          if (response.obj != null) {
            emit(
              state.copyWith(
                skip: 1,
                totalPage: response.totalPage,
                transactionsReponse: response.obj as List<TransactionResponse>,
                transactionsReponseDisplay:
                    response.obj as List<TransactionResponse>,
                onGetHistoryTransaction: RequestStatus.success,
                isFirstLoad: true,
              ),
            );
          } else {
            emit(
              state.copyWith(
                totalPage: 0,
                skip: 0,
                isFirstLoad: false,
                transactionsReponse: [],
                onGetHistoryTransaction: RequestStatus.success,
              ),
            );
          }
        });
      } else {
        emit(state.copyWith(
          transactionsReponseDisplay: state.transactionsReponseDisplay,
          onGetHistoryTransaction: RequestStatus.success,
        ));
      }
    } catch (e) {
      emit(state.copyWith(onGetHistoryTransaction: RequestStatus.failure));
    }
  }

  String getTypeRequest(int value) {
    switch (value) {
      case 0:
        return 'normal';
      case 1:
        return 'alt';
      default:
        return '';
    }
  }

  void emitSelectTab(int value) {
    emit(state.copyWith(
      indexTab: value,
      skip: 0,
      totalPage: 0,
      isFirstLoad: false,
      transactionsReponseDisplay: [],
    ));
    getHistoryTransactions();
  }
}
