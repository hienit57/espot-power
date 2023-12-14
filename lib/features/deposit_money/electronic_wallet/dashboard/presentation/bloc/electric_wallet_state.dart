part of 'electric_wallet_cubit.dart';

class ElectricWalletState extends Equatable {
  final RequestStatus? onGetView;

  final ElectronicWallet? electronicWalletSelected;

  const ElectricWalletState({
    this.onGetView,
    this.electronicWalletSelected,
  });

  ElectricWalletState copyWith({
    RequestStatus? onGetView,
    ElectronicWallet? electronicWalletSelected,
  }) {
    return ElectricWalletState(
      onGetView: onGetView ?? this.onGetView,
      electronicWalletSelected:
          electronicWalletSelected ?? this.electronicWalletSelected,
    );
  }

  @override
  List<Object?> get props => [
        onGetView,
        electronicWalletSelected,
      ];
}
