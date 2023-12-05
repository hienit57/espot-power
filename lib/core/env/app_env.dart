import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnviroment {
  static final AppEnviroment instance = AppEnviroment._internal();

  factory AppEnviroment() {
    return instance;
  }

  AppEnviroment._internal();

  Future<void> initialize() async {
    await dotenv.load(fileName: ".env");
  }

  String getApiUrl() {
    if (kDebugMode) {
      return '${dotenv.env['DEBUG_API_URL']}';
    } else {
      return '${dotenv.env['PRODUCTION_API_URL']}';
    }
  }
}
