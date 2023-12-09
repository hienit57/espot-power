import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

class DeleteAccountDatasourcesImpl extends DeleteAccountDatasources {
  @override
  Future<BaseResponseWithObj> deleteAccount() async {
    Map<String, dynamic> queryParameters = {}
      ..removeWhere((key, value) => value == '' || value == null);

    final res = await ApiService()
        .request(DeleteAccountRequest(queryParameters: queryParameters));

    return BaseResponseWithObj.fromJson(res);
  }
}
