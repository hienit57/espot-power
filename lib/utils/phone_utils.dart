import 'contries.dart';

String separatePhoneAndDialCode({required String phoneWithDialCode}) {
  Map<String, String> foundedCountry = {};
  for (var country in Countries.allCountries) {
    String dialCode = country["dial_code"].toString();
    if (phoneWithDialCode.contains(dialCode)) {
      foundedCountry = country;
    }
  }

  if (foundedCountry.isNotEmpty) {
    var dialCode = phoneWithDialCode.substring(
      0,
      foundedCountry["dial_code"]!.length,
    );
    var newPhoneNumber = phoneWithDialCode.substring(
      foundedCountry["dial_code"]!.length,
    );
  }
  return foundedCountry["dial_code"] ?? '';
}
