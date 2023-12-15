import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

class AddBankAccountDatasourcesImpl extends AddBankAccountDatasources {
  @override
  Future<BaseResponseWithObj> verify() async {
    Map<String, dynamic> queryParameters = {}
      ..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(ExampleRequest(queryParameters: queryParameters));

    return BaseResponseWithObj.fromJson(res);
  }
}
