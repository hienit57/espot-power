import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/routes/app_pages.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/models/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:espot_power/utils/index.dart';
import 'package:flutter/material.dart';

class ChargingStationErrorPage extends StatelessWidget {
  final InformationChargingStationReponse? informationChargingStationReponse;
  const ChargingStationErrorPage({
    Key? key,
    this.informationChargingStationReponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWrapperWidget(
      isViewSupportProblem: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 70),
            const CImage(
              assetsPath: AppAssets.iconCheckOutFailed,
              width: 120,
              height: 120,
            ),
            const SizedBox(height: 36),
            _buildErrorMessage(),
            const SizedBox(height: 48),
            _buildButtonContactSupport(),
            const SizedBox(height: 24),
            _buildNoteAndBackHome(),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorMessage() {
    return Column(
      children: [
        Center(
          child: CText(
            text: LocaleKeys.title_device_not_work.tr(),
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: CText(
            text: LocaleKeys.content_device_not_work.tr(),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildButtonContactSupport() {
    CallServiceContact contact = CallServiceContact();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        children: [
          CContainer(
            height: 40,
            borderColor: AppColors.colorText231F20,
            radius: 10,
            onTap: () => contact
                .call(informationChargingStationReponse?.masterTel ?? ''),
            child: Center(
              child: CText(
                text: LocaleKeys.contact_station_location.tr(),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: CContainer(
              height: 40,
              borderColor: AppColors.colorFFCB05,
              backgroundColor: AppColors.colorFFCB05,
              radius: 10,
              onTap: () => contact
                  .call(informationChargingStationReponse?.espotTel ?? ''),
              child: Center(
                child: CText(
                  text:
                      '${LocaleKeys.contact.tr()} ${LocaleKeys.espot_power.tr()}',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNoteAndBackHome() {
    return Column(
      children: [
        CContainer(
          backgroundColor: AppColors.colorFFF9E3,
          radius: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                style: TextStyle(
                  fontFamily: AppFonts.svnGotham,
                  fontSize: 14,
                  color: AppColors.colorText231F20,
                  wordSpacing: 1.6,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    text: LocaleKeys.note.tr(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: LocaleKeys.note_device_not_work.tr(),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 14),
          child: CContainer(
            height: 40,
            borderColor: AppColors.colorText231F20,
            radius: 10,
            onTap: () {
              NavigatorExt.pushAndRemoveUntil(
                  AppContext.navigatorKey.currentContext!,
                  const HomePage(indexTab: 0),
                  AppRoutes.chargingStationErrorPage);
            },
            child: Center(
              child: CText(
                text: LocaleKeys.goback_home.tr(),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
