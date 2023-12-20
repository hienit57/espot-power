import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class InitialSlidingWidget extends StatelessWidget {
  const InitialSlidingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onVerticalDragUpdate: (details) {
        BlocProvider.of<MapCubit>(context)
            .slidingController
            .add(StatusSliding.middle);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 24, bottom: 12),
            child: FocusLocationWidget(),
          ),
          Container(
            height: 54,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -1),
                  blurRadius: 3,
                  color: Color.fromRGBO(35, 31, 32, 0.15),
                ),
              ],
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 147),
                      child: Container(
                        height: 3,
                        decoration: BoxDecoration(
                          color: AppColors.colorText231F20.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 13),
                  Padding(
                    padding: const EdgeInsets.only(left: 23),
                    child: CText(
                      textAlign: TextAlign.left,
                      text: LocaleKeys.find_near_shop.tr(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
