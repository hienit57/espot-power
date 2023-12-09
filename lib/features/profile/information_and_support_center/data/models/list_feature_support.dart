import 'package:espot_power/generated/locale_keys.g.dart';
import 'package:espot_power/index.dart';

class FeatureSupport {
  final String? name;
  final String? url;

  FeatureSupport({this.name, this.url});
}

List<FeatureSupport> listFeatureSupportInformation = [
  FeatureSupport(
    name: LocaleKeys.about_us.tr(),
    url: 'https://www.flutter.com/',
  ),
  FeatureSupport(
    name: LocaleKeys.product_introduction.tr(),
    url: 'https://espot.vn/san-pham/',
  ),
  FeatureSupport(
    name: LocaleKeys.letter_founder_espots.tr(),
    url: 'https://espot.vn/thu-nha-sang-lap-e-spot/',
  ),
  FeatureSupport(
    name: LocaleKeys.espot_ecosystem.tr(),
    url: 'https://espot.vn/he-sinh-thai-e-spot/',
  ),
];

List<FeatureSupport> listFeatureSupport = [
  FeatureSupport(
    name: LocaleKeys.center_cskh.tr(),
    url: 'https://espot.vn/trung-tam-cskh/',
  ),
  FeatureSupport(
    name: LocaleKeys.terms_use.tr(),
    url: 'https://espot.vn/san-pham/dieu-khoan-su-dung/',
  ),
  FeatureSupport(
    name: LocaleKeys.privacy_policy.tr(),
    url: 'https://espot.vn/chinh-sach-bao-mat-thong-tin/',
  ),
  FeatureSupport(
    name: LocaleKeys.payment_policy.tr(),
    url:
        'https://espot.vn/he-sinh-thai-e-spot/chinh-sach-thanh-toan-tai-e-spot/',
  ),
];
