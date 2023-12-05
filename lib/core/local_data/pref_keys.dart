enum PrefsKeys {
  deviceToken,
  accessToken,
  isViewOnboarding,
}

extension PrefsKeysExtension on PrefsKeys {
  String get value {
    switch (this) {
      case PrefsKeys.isViewOnboarding:
        return 'IS_VIEW_ONBOARDING';
      default:
        return '';
    }
  }
}
