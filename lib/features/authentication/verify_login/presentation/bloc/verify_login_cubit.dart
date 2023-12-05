import 'package:espot_power/features/index.dart';

part 'verify_login_state.dart';

class VerifyLoginCubit extends Cubit<VerifyLoginState>
    with LoadingMixin, ToastMixin {
  VerifyLoginCubit() : super(const VerifyLoginState());
}
