import 'package:easy_localization/easy_localization.dart';

class Validation {
  static String validationTime({String? typeFormat, String? value}) {
    DateTime parseValue = DateTime.parse(value ?? '');
    final formatter = DateFormat(typeFormat ?? 'dd-MM-yyyy');
    String dateTime = formatter.format(parseValue);
    return dateTime;
  }
}
