import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/routes/app_pages.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/models/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:espot_power/utils/index.dart';
import 'package:flutter/material.dart';

class OrderConfirmationPage extends StatelessWidget {
  final InformationChargingStationReponse? informationChargingStationReponse;

  const OrderConfirmationPage({
    super.key,
    this.informationChargingStationReponse,
  });

  @override
  Widget build(BuildContext context) {
    final _dashboardProfileCubit =
        BlocProvider.of<DashboardProfileCubit>(context);
    BlocProvider.of<ConfirmForRentCubit>(context).initData();

    _dashboardProfileCubit.getUserProfile();

    return BaseWrapperWidget(
      onReturn: () {
        NavigatorExt.pushAndRemoveUntil(
          context,
          const HomePage(
            indexTab: 2,
            child: AllScreenHome.qrScan,
          ),
          AppRoutes.qrScan,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Center(
              child: CText(
                text: LocaleKeys.order_confirm.tr(),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),
            _buildInforBalance(),
            const SizedBox(height: 24),
            CText(
              text: LocaleKeys.place_rental_batteries.tr(),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 16),
            _buildLocation(),
            const SizedBox(height: 24),
            _buildInformationPriceRent(),
            _buildButtonConfirm(context)
          ],
        ),
      ),
    );
  }

  _buildInforBalance() {
    return BlocConsumer<DashboardProfileCubit, DashboardProfileState>(
      buildWhen: (previous, current) =>
          previous.onGetUserProfile != current.onGetUserProfile,
      listenWhen: (previous, current) =>
          previous.onGetUserProfile != current.onGetUserProfile,
      listener: (context, state) =>
          BlocProvider.of<ConfirmForRentCubit>(context)
              .emitUserProfileReponse(state.userProfileResponse),
      builder: (context, state) {
        return ViewFinanceWidget(
          userProfileResponse: state.userProfileResponse,
        );
      },
    );
  }

  _buildLocation() {
    Future<String>? getDistance() => FormatUtils().calculateDistance(
        double.parse(informationChargingStationReponse?.lat ?? '0'),
        double.parse(informationChargingStationReponse?.lng ?? '0'));

    return Row(
      children: [
        if (informationChargingStationReponse?.shopImageUrl == 'undefined') ...[
          const CImage(
            radius: 10,
            width: 88,
            height: 88,
            assetsPath: AppAssets.imgInstructionPayBattery,
          ),
        ] else ...[
          CImage(
            radius: 10,
            width: 88,
            height: 88,
            imageNetworkUrl: informationChargingStationReponse?.shopImageUrl,
          ),
        ],
        Expanded(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: CText(
                      text: informationChargingStationReponse?.shopName,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      lineSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    child: CText(
                      text: informationChargingStationReponse?.completeAddr,
                      lineSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 4),
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
                        ),
                      ),
                      FutureBuilder<String>(
                        future: getDistance(),
                        builder: (context, snapshot) {
                          return CText(
                            text: snapshot.data,
                            textColor: AppColors.colorText514D56,
                            fontWeight: FontWeight.w500,
                          );
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  _buildInformationPriceRent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CText(
          text: LocaleKeys.price_rental_batteries.tr(),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 16),
        ItemDetailInformationWidget(
          icon: AppAssets.imgDetailCostRental,
          title: informationChargingStationReponse?.getPriceInHour,
          content: LocaleKeys.content_price_rental.tr(),
        ),
        const SizedBox(height: 16),
        ItemDetailInformationWidget(
          icon: AppAssets.imgDetailDeposit,
          title: '50,000đ',
          content: LocaleKeys.content_deposit_rental_battery.tr(),
        ),
      ],
    );
  }

  _buildButtonConfirm(BuildContext context) {
    return BlocConsumer<ConfirmForRentCubit, ConfirmForRentState>(
      buildWhen: (previous, current) =>
          previous.onCreateOrder != current.onCreateOrder ||
          previous.msgCreateOrder != current.msgCreateOrder,
      listenWhen: (previous, current) =>
          previous.onCreateOrder != current.onCreateOrder ||
          previous.msgCreateOrder != current.msgCreateOrder,
      listener: (context, state) {
        if (state.onCreateOrder == RequestStatus.failure &&
            state.msgCreateOrder == LocaleKeys.balance_not_enough.tr()) {
          NavigatorExt.pushAndRemoveUntil(
            context,
            const BalanceNotEnoughPage(),
            AppRoutes.orderConfirmation,
          );
        }
        if (state.onCreateOrder == RequestStatus.success) {
          NavigatorExt.pushAndRemoveUntil(
            context,
            const SystemProcessingPage(),
            AppRoutes.orderConfirmation,
          );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  CText(
                    fontSize: 13,
                    textColor: AppColors.colorEC222D,
                    fontWeight: FontWeight.w400,
                    lineSpacing: 1,
                    text: state.msgCreateOrder !=
                            LocaleKeys.balance_not_enough.tr()
                        ? state.msgCreateOrder
                        : '',
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 112),
              child: CButton(
                height: 40,
                width: double.infinity,
                radius: 10,
                backgroundColor: AppColors.colorFFCB08,
                title: LocaleKeys.continues.tr(),
                titleFontWeight: FontWeight.w500,
                onPressed: () => BlocProvider.of<ConfirmForRentCubit>(context)
                    .createOrder(informationChargingStationReponse?.codeNum),
              ),
            ),
          ],
        );
      },
    );
  }
}
