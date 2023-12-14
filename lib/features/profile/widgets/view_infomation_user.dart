import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class ViewInformationUserWidget extends StatelessWidget {
  final UserProfileResponse? userProfileResponse;
  const ViewInformationUserWidget({
    super.key,
    this.userProfileResponse,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CImage(
          assetsPath: AppAssets.imgProfilePersonDefault,
          width: 84,
          height: 84,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CText(
                text: userProfileResponse?.getUserName,
                fontSize: 18,
                fontWeight:
                    FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.5),
                textOverflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              _checkVerifyStatus(
                icon: userProfileResponse?.isVerifyUser == true
                    ? AppAssets.iconProfileVerify
                    : AppAssets.iconProfileNotVerify,
                name: userProfileResponse?.isVerifyUser == true
                    ? LocaleKeys.verification_tile.tr()
                    : LocaleKeys.not_verify.tr(),
              ),
              _checkVerifyStatus(
                icon: userProfileResponse?.isMemberNew == true
                    ? AppAssets.iconProfileMemberMain
                    : AppAssets.iconProfileMemberNew,
                name: userProfileResponse?.isMemberNew == true
                    ? LocaleKeys.official_member.tr()
                    : LocaleKeys.new_member.tr(),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _checkVerifyStatus({String? icon, String? name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CImage(
          width: 16,
          height: 16,
          assetsPath: icon,
        ),
        const SizedBox(width: 4),
        CText(
          text: name,
          textColor: AppColors.colorText514D56,
        )
      ],
    );
  }
}
