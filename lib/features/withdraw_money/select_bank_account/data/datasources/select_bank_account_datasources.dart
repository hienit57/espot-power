import 'package:espot_power/core/index.dart';

abstract class SelectBankAccountDatasources {
  Future<BaseResponseWithObj> getListYourBank();
}
