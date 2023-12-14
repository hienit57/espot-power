import 'package:espot_power/index.dart';

enum PriceDepositMoney {
  price10k,
  price20k,
  price50k,
  price100k,
  price200k,
  otherPrice;

  String get title {
    switch (this) {
      case PriceDepositMoney.price10k:
        return LocaleKeys.price10k.tr();
      case PriceDepositMoney.price20k:
        return LocaleKeys.price20k.tr();
      case PriceDepositMoney.price50k:
        return LocaleKeys.price50k.tr();
      case PriceDepositMoney.price100k:
        return LocaleKeys.price100k.tr();
      case PriceDepositMoney.price200k:
        return LocaleKeys.price200k.tr();
      case PriceDepositMoney.otherPrice:
        return LocaleKeys.number_other.tr();
    }
  }
}
