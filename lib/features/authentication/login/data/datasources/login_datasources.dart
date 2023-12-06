import 'package:espot_power/core/network/index.dart';
import 'package:espot_power/features/index.dart';

abstract class LoginDatasources {
  Future<BaseRequestResponse> login(LoginModelRequest dataRequest);
}
