import 'package:collection/collection.dart' show IterableExtension;
import 'package:espot_power/common/index.dart';

/// Country element. This is the element that contains all the information
class ProvincesResponse {
  /// the name of the country
  String? name;

  ProvincesResponse({
    this.name,
  });

  factory ProvincesResponse.fromCountryCode(String countryCode) {
    final Map<String, String>? jsonCode = provinces.firstWhereOrNull(
      (code) => code['name']?.toLowerCase() == countryCode.toLowerCase(),
    );
    return ProvincesResponse.fromJson(jsonCode!);
  }

  factory ProvincesResponse.fromDialCode(String dialCode) {
    final Map<String, String>? jsonCode = provinces.firstWhereOrNull(
      (code) => code['name'] == dialCode,
    );
    return ProvincesResponse.fromJson(jsonCode!);
  }

  factory ProvincesResponse.fromJson(Map<String, dynamic> json) {
    return ProvincesResponse(
      name: json['name'],
    );
  }

  String toCountryStringOnly() {
    return '$_cleanName';
  }

  String? get _cleanName {
    return name?.replaceAll(RegExp(r'[[\]]'), '').split(',').first;
  }
}
