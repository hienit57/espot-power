import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/const.dart';
import 'package:espot_power/core/mixins/dialog_mixin.dart';
import 'package:espot_power/extensions/outside_service.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/models/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:espot_power/utils/index.dart';
import 'package:flutter/material.dart';

class DetailsLocationPage extends StatelessWidget with DialogMixin {
  const DetailsLocationPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      buildWhen: (previous, current) =>
          previous.markerSelected != current.markerSelected,
      builder: (context, state) {
        Future<String>? getDistance() => FormatUtils().calculateDistance(
            double.parse(state.markerSelected?.lat ?? '0'),
            double.parse(state.markerSelected?.lng ?? '0'));
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 264,
              width: double.infinity,
              child: Stack(
                children: [
                  CImage(
                    height: 220,
                    width: double.infinity,
                    imageNetworkUrl: state.markerSelected?.shopAvatarUrl,
                    boxFit: BoxFit.cover,
                  ),
                  CContainer(
                    width: double.infinity,
                    borderColor: AppColors.colorText231F20.withOpacity(0.6),
                    height: 220,
                    backgroundColor: AppColors.colorText231F20.withOpacity(0.6),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 53, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.white,
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: CText(
                            text: state.markerSelected?.shopName ??
                                "The Coffee Shop",
                            textAlign: TextAlign.center,
                            fontSize: 20,
                            textOverflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.lerp(
                                FontWeight.w400, FontWeight.w500, 0.5),
                            textColor: AppColors.white,
                          ),
                        ),
                        const SizedBox(width: 24)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 176, 24, 0),
                    child: Row(
                      children: [
                        CContainer(
                          height: 88,
                          width: 88,
                          borderWidth: 0.5,
                          borderColor: AppColors.colorDADADA,
                          radius: 10,
                          child: CImage(
                            imageNetworkUrl:
                                state.markerSelected?.shopAvatarUrl,
                            radius: 10,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, top: 35),
                          child: Row(
                            children: [
                              _buildStatus(
                                icon: AppAssets.iconDot,
                                iconColor: AppColors.color34A853,
                                content: state.markerSelected?.timeShopOpen,
                                contentFontSize: 11,
                                contentFontWeight: FontWeight.w500,
                                contentColor: AppColors.color34A853,
                              ),
                              const SizedBox(width: 8),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 3),
                                    child: CImage(
                                      assetsPath: AppAssets.iconItemCompass,
                                      width: 14,
                                      height: 14,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: CText(
                                      text: LocaleKeys.distance.tr(),
                                      textColor: AppColors.colorText514D56,
                                      fontSize: 12,
                                    ),
                                  ),
                                  FutureBuilder<String>(
                                    future: getDistance(),
                                    builder: (context, snapshot) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 2),
                                        child: CText(
                                          text: snapshot.data,
                                          textColor: AppColors.colorText514D56,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CText(
                    text: state.markerSelected?.displayAddr ?? '',
                    fontWeight: FontWeight.w500,
                    lineSpacing: 1.2,
                  ),
                  const SizedBox(height: 3.5),
                  _rowIconContent(
                    icon: AppAssets.imgDetailCostRental,
                    title1: '7.000${LocaleKeys.vnd_hour.tr()}',
                    content: LocaleKeys.content_price_rental.tr(),
                  ),
                  _rowIconContent(
                    icon: AppAssets.imgDetailAmountBattery,
                    title1: LocaleKeys.still.tr(),
                    title2:
                        '${state.markerSelected?.canBorrow} ${LocaleKeys.rechargeable_batteries.tr()}',
                    content: LocaleKeys.content_scan_qr.tr(),
                  ),
                  _rowIconContent(
                    icon: AppAssets.imgDetailEmptyBattery,
                    title1: LocaleKeys.still.tr(),
                    title2:
                        '${state.markerSelected?.canRepay} ${LocaleKeys.empty_slot.tr()}',
                    content: LocaleKeys.content_slot_charging_battery.tr(),
                  ),
                  _rowIconContent(
                    icon: AppAssets.imgDetailDeposit,
                    //price: widget.money,
                    title1:
                        '${state.markerSelected?.getPriceService} ${LocaleKeys.deposit_rental_battery.tr()}',
                    content: LocaleKeys.content_deposit_rental_battery.tr(),
                  ),
                  state.markerSelected?.getFreeTimeOfService == '0'
                      ? const SizedBox(height: 32)
                      : _rowIconContent(
                          icon: AppAssets.imgDetailFreeTimeBattery,
                          //price: widget.freeTime,
                          title1:
                              '${state.markerSelected?.getFreeTimeOfService} ${LocaleKeys.minutes_used_free.tr()}',
                          content: LocaleKeys.invite_experience_free.tr(),
                        ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 36, 24, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: CButton(
                      width: 152,
                      height: 40,
                      backgroundColor: AppColors.white,
                      borderWidth: 1,
                      borderColor: AppColors.colorText231F20.withOpacity(0.4),
                      radius: 10,
                      onPressed: () {
                        // StoreModel? storeModel = widget.store;
                        // if (storeModel != null) {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (_) => DirectionScreen(
                        //               store: storeModel,
                        //               currentLocation: widget.currentLocation)));
                        // }
                      },
                      title: LocaleKeys.direction.tr(),
                      titleFontSize: 14,
                      titleFontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 17),
                  Expanded(
                    flex: 1,
                    child: CButton(
                      width: 152,
                      height: 40,
                      backgroundColor: AppColors.colorFFCB05,
                      radius: 10,
                      onPressed: () =>
                          onTapContact(context, state.markerSelected)
                      // showGeneralDialog(
                      //   barrierLabel: "Barrier",
                      //   barrierDismissible: true,
                      //   barrierColor: Colors.black.withOpacity(0.5),
                      //   transitionDuration: const Duration(milliseconds: 300),
                      //   context: context,
                      //   pageBuilder: (_, __, ___) {
                      //     return Align(
                      //       alignment: Alignment.center,
                      //       child: IntrinsicHeight(
                      //         child: Container(
                      //           width: 300.w,
                      //           height: 346.h,
                      //           decoration: BoxDecoration(
                      //             color: Colors.white,
                      //             borderRadius: BorderRadius.circular(10),
                      //           ),
                      //           child: Column(
                      //             children: [
                      //               Padding(
                      //                 padding: EdgeInsets.only(top: 48.h),
                      //                 child: CImage(
                      //                   svgPath:
                      //                       AssetsSvg.iconDetailDialogTelephone,
                      //                   assetsPath:
                      //                       Assets.iconDetailDialogTelephone,
                      //                   width: 72.h,
                      //                   height: 72.h,
                      //                 ),
                      //               ),
                      //               Padding(
                      //                 padding: EdgeInsets.only(top: 24.h),
                      //                 child: CText(
                      //                   text: LocaleKeys.contact_station_location
                      //                       .tr(),
                      //                   fontSize: FontSize.fontSize_16,
                      //                   fontWeight: FontWeight.w500,
                      //                 ),
                      //               ),
                      //               Padding(
                      //                 padding: EdgeInsets.only(top: 16.h),
                      //                 child: CText(
                      //                   textAlign: TextAlign.center,
                      //                   text: LocaleKeys.info_station_location.tr(),
                      //                   lineSpacing: 1.3,
                      //                 ),
                      //               ),
                      //               Padding(
                      //                 padding: EdgeInsets.only(top: 36.h),
                      //                 child: CButton(
                      //                   width: 148.w,
                      //                   height: 40,
                      //                   radius: 10,
                      //                   onPressed: () {
                      //                     _urlService.call(widget.phoneShop ?? '');
                      //                   },
                      //                   title: LocaleKeys.call_telephone.tr(),
                      //                   fontWeight: FontWeight.w500,
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     );
                      //   },
                      // );
                      ,
                      title: LocaleKeys.contact.tr(),
                      titleFontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => onTapProblem(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const CImage(
                    assetsPath: AppAssets.iconProblem,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 5),
                  CText(
                    text: LocaleKeys.your_problem.tr(),
                    textColor: AppColors.colorText514D56,
                    textDecoration: TextDecoration.underline,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }

  _rowIconContent({
    String? icon,
    String? title1,
    String? title2,
    String? content,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.5),
      child: Row(
        children: [
          CImage(
            assetsPath: icon,
            width: 33,
            height: 33,
          ),
          const SizedBox(width: 12),
          SizedBox(
            height: 33,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppFonts.svnGotham,
                      color: AppColors.colorText231F20,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: title1,
                      ),
                      TextSpan(
                        text: title2,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.colorText231F20,
                        ),
                      ),
                    ],
                  ),
                ),
                CText(
                  text: content,
                  fontSize: 11,
                  textColor: AppColors.color979797,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildStatus({
    String? icon,
    Color? iconColor,
    String? content,
    FontWeight? contentFontWeight,
    Color? contentColor,
    double? contentFontSize,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CImage(
          assetsPath: icon,
          width: 14,
          height: 14,
          color: iconColor,
        ),
        const SizedBox(width: 4),
        CText(
          text: content,
          fontSize: contentFontSize,
          fontWeight: contentFontWeight,
          textColor: contentColor,
        )
      ],
    );
  }

  void onTapProblem(BuildContext context) {
    cShowGeneralDialog(
      context,
      widget: Align(
        alignment: Alignment.center,
        child: IntrinsicHeight(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 37),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close, size: 24),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const CImage(
                  assetsPath: AppAssets.iconMapSupportDialogProblem,
                  width: 72,
                  height: 72,
                ),
                const SizedBox(height: 24),
                CText(
                  text: LocaleKeys.your_problem.tr(),
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: AppColors.colorText231F20,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.svnGotham,
                      ),
                      children: [
                        TextSpan(
                          text: LocaleKeys.suggest_line1_tile.tr(),
                        ),
                        TextSpan(
                          text: ' ${LocaleKeys.espot.tr()} ',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ]),
                ),
                const SizedBox(height: 8),
                CText(
                  text: LocaleKeys.suggest_line2_tile.tr(),
                ),
                const SizedBox(height: 36),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CButton(
                          height: 40,
                          backgroundColor: AppColors.white,
                          borderColor:
                              AppColors.colorText231F20.withOpacity(0.4),
                          radius: 10,
                          onPressed: () {
                            OutsideService().call(telephoneCompany);
                          },
                          title: LocaleKeys.call_phone_tile.tr(),
                          titleFontSize: 14,
                          titleColor: AppColors.colorText231F20,
                          titleFontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 7),
                      Expanded(
                        flex: 1,
                        child: CButton(
                          height: 40,
                          backgroundColor: AppColors.white,
                          borderColor:
                              AppColors.colorText231F20.withOpacity(0.4),
                          radius: 10,
                          onPressed: () {
                            OutsideService().sendMail(AppAssets.emailCompany);
                          },
                          title: LocaleKeys.send_email_tile.tr(),
                          titleFontSize: 14,
                          titleColor: AppColors.colorText231F20,
                          titleFontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTapContact(BuildContext context, LocationResponse? locationResponse) {
    cShowGeneralDialog(
      context,
      widget: Align(
        alignment: Alignment.center,
        child: IntrinsicHeight(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 37),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close, size: 24),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const CImage(
                  assetsPath: AppAssets.iconDetailDialogTelephone,
                  width: 72,
                  height: 72,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: CText(
                    text: LocaleKeys.contact_station_location.tr(),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: CText(
                    textAlign: TextAlign.center,
                    text: LocaleKeys.info_station_location.tr(),
                    lineSpacing: 1.3,
                  ),
                ),
                const SizedBox(height: 48),
                CButton(
                  width: 152,
                  height: 40,
                  backgroundColor: AppColors.colorFFCB05,
                  radius: 10,
                  onPressed: () =>
                      OutsideService().call(locationResponse?.masterTel ?? ''),
                  title: LocaleKeys.call_telephone.tr(),
                  titleFontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
