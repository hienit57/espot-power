import 'package:bas_clean_architecture/index.dart';

mixin LoadingMixin {
  showLoading() {
    EasyLoading.show(status: 'loading...');
  }

  dismissloading() {
    EasyLoading.dismiss();
  }
}
