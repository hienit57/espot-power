part of 'history_transaction_cubit.dart';

class HistoryTransactionState extends Equatable {
  final RequestStatus? onGetHistoryTransaction;

  final int? skip;
  final int? totalPage;
  final bool? isFirstLoad;

  final List<TransactionResponse>? transactionsReponse;
  final List<TransactionResponse>? transactionsReponseDisplay;

  final int? indexTab;

  const HistoryTransactionState({
    this.onGetHistoryTransaction,
    this.skip,
    this.totalPage,
    this.transactionsReponse,
    this.transactionsReponseDisplay,
    this.indexTab,
    this.isFirstLoad,
  });

  HistoryTransactionState copyWith({
    RequestStatus? onGetHistoryTransaction,
    int? indexTab,
    int? totalPage,
    List<TransactionResponse>? transactionsReponse,
    List<TransactionResponse>? transactionsReponseDisplay,
    int? skip,
    bool? isFirstLoad,
  }) {
    return HistoryTransactionState(
      onGetHistoryTransaction:
          onGetHistoryTransaction ?? this.onGetHistoryTransaction,
      indexTab: indexTab ?? this.indexTab,
      totalPage: totalPage ?? this.totalPage,
      transactionsReponse: transactionsReponse ?? this.transactionsReponse,
      transactionsReponseDisplay:
          transactionsReponseDisplay ?? this.transactionsReponseDisplay,
      skip: skip ?? this.skip,
      isFirstLoad: isFirstLoad ?? this.isFirstLoad,
    );
  }

  @override
  List<Object?> get props => [
        onGetHistoryTransaction,
        indexTab,
        totalPage,
        transactionsReponse,
        transactionsReponseDisplay,
        skip,
        isFirstLoad,
      ];
}
