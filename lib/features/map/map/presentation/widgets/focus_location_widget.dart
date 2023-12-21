import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FocusLocationWidget extends StatelessWidget {
  const FocusLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      buildWhen: (previous, current) =>
          previous.currentLocationUser != current.currentLocationUser,
      builder: (context, state) {
        final latLng = LatLng(
          double.parse(state.currentLocationUser?.latitude.toString() ?? '0'),
          double.parse(state.currentLocationUser?.longitude.toString() ?? '0'),
        );
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async =>
              await BlocProvider.of<MapCubit>(context).updateCamera(latLng),
          child: Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
            ),
            child: const Center(
              child: CImage(
                assetsPath: AppAssets.iconMapSentLocation,
                width: 24,
                height: 24,
              ),
            ),
          ),
        );
      },
    );
  }
}
