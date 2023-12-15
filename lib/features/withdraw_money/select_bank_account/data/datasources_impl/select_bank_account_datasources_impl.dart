import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

class SelectBankAccountDatasourcesImpl extends SelectBankAccountDatasources {
  @override
  Future<BaseResponseWithObj> getListYourBank() async {
    Map<String, dynamic> queryParameters = {}
      ..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(GetListBankRequest(queryParameters: queryParameters));

    return BaseResponseWithObj.fromJson(res);
  }
}
