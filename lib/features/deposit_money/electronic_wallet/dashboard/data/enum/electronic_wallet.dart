import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';

enum ElectronicWallet {
  zalopay,
  //momo
  ;

  String get title {
    switch (this) {
      case ElectronicWallet.zalopay:
        return LocaleKeys.zalopay.tr();
      // case ElectronicWallet.momo:
      //   return LocaleKeys.momo.tr();
    }
  }

  String get icon {
    switch (this) {
      case ElectronicWallet.zalopay:
        return AppAssets.imgDepositZalopay;
      // case ElectronicWallet.momo:
      //   return AppAssets.imgDepositMomo;
    }
  }
}
