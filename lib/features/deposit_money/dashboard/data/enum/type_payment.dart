import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';

enum TypePayments {
  bankTransfer,
  electronicWallet,
  visaMastercard,
  internetBanking;

  String get getIconPayment {
    switch (this) {
      case TypePayments.bankTransfer:
        return AppAssets.iconDepositTransferBank;
      case TypePayments.electronicWallet:
        return AppAssets.iconDepositElectronicWallet;
      case TypePayments.visaMastercard:
        return AppAssets.iconVisaMasterCard;
      case TypePayments.internetBanking:
        return AppAssets.iconAtmCheck;
    }
  }

  String get getTitlePayment {
    switch (this) {
      case TypePayments.bankTransfer:
        return LocaleKeys.bank_transfer.tr();
      case TypePayments.electronicWallet:
        return LocaleKeys.electronic_wallet.tr();
      case TypePayments.visaMastercard:
        return LocaleKeys.visa_master_card.tr();
      case TypePayments.internetBanking:
        return 'ATM/Internet Banking';
    }
  }
}
