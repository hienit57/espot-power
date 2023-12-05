class AppEnv {
  String? debugURL;
  String? stagingURL;
  String? productionURL;
  int? isProduction;

  AppEnv(
      {this.debugURL, this.stagingURL, this.productionURL, this.isProduction});

  AppEnv.fromJson(Map<String, dynamic> json) {
    debugURL = json['DEBUG_API_URL'];
    stagingURL = json['STAGING_API_URL'];
    productionURL = json['PRODUCTION_API_URL'];
    isProduction = json['IS_PRODUCTION'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['DEBUG_API_URL'] = debugURL;
    data['STAGING_API_URL'] = stagingURL;
    data['PRODUCTION_API_URL'] = productionURL;
    data['IS_PRODUCTION'] = isProduction;
    return data;
  }
}
