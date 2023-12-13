import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';

class TabbarActionModel {
  final int? index;
  final String? icon;
  String? name;

  TabbarActionModel({
    this.index,
    this.icon,
    this.name,
  });
}

List<TabbarActionModel> listTabbarActionModel = [
  TabbarActionModel(
    index: 0,
    icon: AppAssets.iconTabbarMapUnChecked,
    name: LocaleKeys.map.tr(),
  ),
  TabbarActionModel(
    index: 1,
    icon: AppAssets.iconTabbarOrderUnChecked,
    name: LocaleKeys.transaction.tr(),
  ),
  TabbarActionModel(
    index: 2,
    icon: AppAssets.iconTabbarScan,
    name: '',
  ),
  TabbarActionModel(
    index: 3,
    icon: AppAssets.iconTabbarNotifiUnChecked,
    name: LocaleKeys.notification.tr(),
  ),
  TabbarActionModel(
    index: 4,
    icon: AppAssets.iconTabbarProfileUnChecked,
    name: LocaleKeys.account.tr(),
  ),
];
