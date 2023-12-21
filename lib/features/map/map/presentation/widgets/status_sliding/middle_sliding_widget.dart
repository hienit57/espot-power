import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/models/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:espot_power/utils/index.dart';
import 'package:flutter/material.dart';

class MiddleSlidingWidget extends StatelessWidget {
  final bool? isEmptyLocation;

  const MiddleSlidingWidget({
    super.key,
    this.isEmptyLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 24, bottom: 24),
          child: FocusLocationWidget(),
        ),
        Container(
          height: 172,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 4),
                blurRadius: 10,
              )
            ],
          ),
          child: BlocBuilder<MapCubit, MapState>(
            buildWhen: (previous, current) =>
                previous.markerSelected != current.markerSelected,
            builder: (context, state) {
              return Column(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onVerticalDragUpdate: (details) {
                      double offetHeight = details.primaryDelta!;

                      if (offetHeight < 0) {
                        BlocProvider.of<MapCubit>(context)
                            .slidingController
                            .add(StatusSliding.high);
                      } else if (offetHeight > 0) {
                        BlocProvider.of<MapCubit>(context)
                            .slidingController
                            .add(StatusSliding.initial);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 145),
                      child: SizedBox(
                        height: 37,
                        width: double.infinity,
                        child: Column(
                          children: [
                            const SizedBox(height: 12),
                            Container(
                              height: 3,
                              decoration: BoxDecoration(
                                color:
                                    AppColors.colorText231F20.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            const SizedBox(height: 21),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (state.markerSelected?.id == null) ...[
                    const EmptyLocationWidget(imageHeight: 76)
                  ] else ...[
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2),
                          child: CImage(
                            width: 20,
                            height: 20,
                            assetsPath: AppAssets.iconArrowLeft,
                          ),
                        ),
                        Expanded(
                            child: LocationWidget(
                          informationLocation: state.markerSelected,
                        )),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2),
                          child: CImage(
                            width: 20,
                            height: 20,
                            assetsPath: AppAssets.iconArrowRight,
                          ),
                        ),
                      ],
                    ),
                  ]
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
