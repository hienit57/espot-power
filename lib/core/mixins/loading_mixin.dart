import 'package:espot_power/index.dart';

mixin LoadingMixin {
  showLoading() {
    EasyLoading.show(status: 'loading...');
  }

  dismissloading() {
    EasyLoading.dismiss();
  }
}
