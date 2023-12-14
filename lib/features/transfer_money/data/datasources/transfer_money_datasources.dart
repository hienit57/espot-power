import 'package:espot_power/core/index.dart';
import 'package:espot_power/features/index.dart';

abstract class TransferMoneyDatasources {
  Future<BaseResponseWithObj> getInformationReceiver(String? phoneNumber);
  Future<BaseResponseWithObj> transferMoney(
      TransferMoneyModelRequest dataRequest);
}
