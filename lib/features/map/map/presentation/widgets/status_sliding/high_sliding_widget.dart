import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/models/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class HighSlidingWidget extends StatefulWidget {
  const HighSlidingWidget({super.key});

  @override
  State<HighSlidingWidget> createState() => _HighSlidingWidgetState();
}

class _HighSlidingWidgetState extends State<HighSlidingWidget>
    with AutomaticKeepAliveClientMixin {
  late MapCubit _mapCubit;

  @override
  void initState() {
    _mapCubit = BlocProvider.of<MapCubit>(context);
    _mapCubit.onSearchLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocBuilder<MapCubit, MapState>(
          buildWhen: (previous, current) =>
              previous.onSearchLocation != current.onSearchLocation,
          builder: (context, state) {
            // if (state.onSearchLocation == RequestStatus.loading) {
            //   return Container(
            //     color: Colors.white.withOpacity(0.1),
            //     alignment: Alignment.center,
            //     child: SizedBox(
            //       width: 20,
            //       height: 20,
            //       child: LoadingIndicator(
            //         indicatorType: Indicator.lineScalePulseOutRapid,
            //         colors: [
            //           AppColors.colorffFFCB08,
            //           AppColors.colorffFcec97,
            //           AppColors.colorffFFCB08,
            //           AppColors.colorffFcec97,
            //           AppColors.colorffFFCB08,
            //         ],
            //         pathBackgroundColor: AppColors.white,
            //       ),
            //     ),
            //   );
            // }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onVerticalDragUpdate: (details) {
                    BlocProvider.of<MapCubit>(context)
                        .slidingController
                        .add(StatusSliding.middle);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 120),
                    child: Column(
                      children: [
                        const SizedBox(height: 64),
                        Container(
                          height: 3,
                          decoration: BoxDecoration(
                            color: AppColors.colorText231F20.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ),
                AppTextField(
                  controller: _mapCubit.searchController,
                  placeholder: LocaleKeys.search_place.tr(),
                  borderRadius: 10,
                  prefix: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    child: CImage(
                      width: 24,
                      height: 24,
                      assetsPath: AppAssets.iconSearchLocation,
                      boxFit: BoxFit.contain,
                    ),
                  ),
                  onChanged: (value) {
                    _mapCubit.onSearchChanged();
                  },
                ),
                const SizedBox(height: 27),
                if (state.listLocationSearchResponse?.isNotEmpty ?? false) ...[
                  CText(
                    text: LocaleKeys.charging_station_near_me.tr(),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  const SizedBox(height: 16),
                ],
                if (state.onSearchLocation == RequestStatus.success) ...[
                  Expanded(
                    child: _buildLocationNearMe(
                      listLocationNearMe: state.listLocationSearchResponse,
                    ),
                  ),
                ]
              ],
            );
          },
        ),
      ),
    );
  }

  _buildLocationNearMe({List<LocationResponse>? listLocationNearMe}) {
    if (listLocationNearMe?.isNotEmpty ?? false) {
      return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: listLocationNearMe?.length,
        itemBuilder: (BuildContext context, int index) {
          final location = listLocationNearMe?[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: LocationWidget(
              informationLocation: location,
            ),
          );
        },
      );
    }

    return const Padding(
      padding: EdgeInsets.only(top: 37),
      child: EmptyLocationWidget(
        imageHeight: 154,
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => false;
}
