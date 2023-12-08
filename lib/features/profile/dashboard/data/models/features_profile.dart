import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';

enum FeaturesProfile {
  profileInformation,
  userManual,
  informationAndSupportCenter,
  languageSettings,
  contactForCooperation,
  feedback,
  logout;

  String get icon {
    switch (this) {
      case FeaturesProfile.profileInformation:
        return AppAssets.imgProfile;
      case FeaturesProfile.userManual:
        return AppAssets.imgDocument;
      case FeaturesProfile.informationAndSupportCenter:
        return AppAssets.imgSupport;
      case FeaturesProfile.languageSettings:
        return AppAssets.imgTranslate;
      case FeaturesProfile.contactForCooperation:
        return AppAssets.imgBriefcase;
      case FeaturesProfile.feedback:
        return AppAssets.iconFeedback;
      case FeaturesProfile.logout:
        return AppAssets.imgLogout;
    }
  }

  String get name {
    switch (this) {
      case FeaturesProfile.profileInformation:
        return LocaleKeys.profile_information.tr();
      case FeaturesProfile.userManual:
        return LocaleKeys.user_manual.tr();
      case FeaturesProfile.informationAndSupportCenter:
        return LocaleKeys.information_and_support_center.tr();
      case FeaturesProfile.languageSettings:
        return LocaleKeys.language_settings.tr();
      case FeaturesProfile.contactForCooperation:
        return LocaleKeys.contact_for_cooperation.tr();
      case FeaturesProfile.feedback:
        return LocaleKeys.feedback.tr();
      case FeaturesProfile.logout:
        return LocaleKeys.logout.tr();
    }
  }
}
