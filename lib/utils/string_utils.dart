import 'dart:convert';
import 'dart:typed_data';

class StringUtils {
  static final StringUtils _singleton = StringUtils._internal();

  factory StringUtils() {
    return _singleton;
  }

  StringUtils._internal();

  static Map<int, String> monthsInYear = {
    1: "January",
    2: "February",
    3: "March",
    4: "April",
    5: "May",
    6: "June",
    7: "July",
    8: "August",
    9: "September",
    10: "October",
    11: "November",
    12: "December"
  };

  String capitalizeFirstCharacter(String? text) {
    if (text == null || text == '') {
      return '';
    }
    return "${text[0].toUpperCase()}${text.substring(1).toLowerCase()}";
  }

  String base64String(Uint8List data) {
    return base64Encode(data);
  }

  String ordinal(int number) {
    if (!(number >= 1 && number <= 100)) {
      //here you change the range
      throw Exception('Invalid number');
    }

    if (number >= 11 && number <= 13) {
      return 'th';
    }

    switch (number % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}
