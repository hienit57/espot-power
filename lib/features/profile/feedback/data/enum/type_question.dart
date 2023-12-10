import 'package:espot_power/index.dart';

enum TypeQuestion {
  cantCharge,
  cantRental,
  chargeCantReturn,
  equipmentFailure,
  commandTransmissionError,
  other;

  String get title {
    switch (this) {
      case TypeQuestion.cantCharge:
        return LocaleKeys.cant_charge.tr();
      case TypeQuestion.cantRental:
        return LocaleKeys.cant_rental.tr();
      case TypeQuestion.chargeCantReturn:
        return LocaleKeys.cant_pay_charge.tr();
      case TypeQuestion.equipmentFailure:
        return LocaleKeys.device_failure.tr();
      case TypeQuestion.commandTransmissionError:
        return LocaleKeys.error_transmission.tr();
      case TypeQuestion.other:
        return LocaleKeys.other_other.tr();
    }
  }
}
