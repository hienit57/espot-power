import 'dart:convert';

import 'package:espot_power/core/app_enviroment/app_env.dart';
import 'package:flutter/services.dart';

class AppEnviroment {
  static final AppEnviroment instance = AppEnviroment._internal();

  factory AppEnviroment() {
    return instance;
  }

  AppEnviroment._internal();

  late AppEnv appEnv;

  Future<void> initialize() async {
    String response = await rootBundle.loadString('env.json');
    Map<String, dynamic> data = await json.decode(response);
    appEnv = AppEnv.fromJson(data);
  }

  String getApiUrl() {
    if (isProduction()) {
      return appEnv.productionURL!;
    } else {
      return appEnv.debugURL!;
    }
  }

  bool isProduction() {
    return appEnv.isProduction == 1;
  }

  bool isDebug() {
    return appEnv.isProduction == 0;
  }
}
