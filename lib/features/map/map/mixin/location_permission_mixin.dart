import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

mixin PermissionMixin {
  Future<void> showNeedLocationPermission({
    VoidCallback? onTapOpenPermission,
    required LocationType locationType,
  }) async {
    return await showNeedPermission(
      onTapOpenPermission: onTapOpenPermission,
      title: LocaleKeys.location_issue.tr(),
      confirmText: locationType == LocationType.grantPermission
          ? LocaleKeys.grant_permission.tr()
          : LocaleKeys.open_gps.tr(),
      content: LocaleKeys.can_not_detect_location.tr(),
    );
  }

  Future<void> showNeedCameraPermission(
      {VoidCallback? onTapOpenPermission}) async {
    return await showNeedPermission(
      onTapOpenPermission: onTapOpenPermission,
      title: LocaleKeys.camera_issue.tr(),
      content: LocaleKeys.can_not_detect_camera.tr(),
      confirmText: LocaleKeys.grant_permission.tr(),
    );
  }

  Future<void> showNeedMicroPhonePermission(
      {VoidCallback? onTapOpenPermission}) async {
    return await showNeedPermission(
      onTapOpenPermission: onTapOpenPermission,
      title: LocaleKeys.micro_phone_issue.tr(),
      content: LocaleKeys.can_not_detect_micro_phone.tr(),
      confirmText: LocaleKeys.grant_permission.tr(),
    );
  }

  Future<void> showNeedPermission({
    VoidCallback? onTapOpenPermission,
    required String title,
    required String content,
    required String confirmText,
  }) async {
    await showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      context: AppContext.navigatorKey.currentContext!,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.center,
          child: IntrinsicHeight(
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(height: 48),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => NavigatorExt.pop(
                              AppContext.navigatorKey.currentContext!),
                          child: const SizedBox(
                            width: 24,
                            height: 24,
                            child: Padding(
                              padding: EdgeInsets.all(4),
                              child: CImage(
                                assetsPath: AppAssets.imgCloseDialog,
                                boxFit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CImage(
                    assetsPath: AppAssets.iconMapSupportDialogProblem,
                    width: 72,
                    height: 72,
                  ),
                  const SizedBox(height: 16),
                  CText(
                    text: title,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: CText(
                      lineSpacing: 1.2,
                      textAlign: TextAlign.center,
                      text: content,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 24),
                  CButton(
                    onPressed: onTapOpenPermission,
                    title: confirmText,
                    width: 152,
                    height: 40,
                    radius: 10,
                    titleFontWeight: FontWeight.w500,
                    backgroundColor: AppColors.colorFFCB05,
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
