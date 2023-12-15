import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

abstract class AddBankAccountDatasources {
  Future<BaseResponseWithObj> getBankList();
  Future<BaseResponseWithObj> verifyAddBankAccount(
      AddBankAccountModelRequest dataRequest);
}
