import 'package:app_settings/app_settings.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget>
    with WidgetsBindingObserver, PermissionMixin {
  late MapCubit _mapCubit;

  bool isBackFromGrantPermission = false;
  bool isBackFromRequestOpenGPS = false;

  @override
  void initState() {
    _mapCubit = BlocProvider.of<MapCubit>(context);

    _checkPermissionLocation();

    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed && isBackFromGrantPermission) {
      isBackFromGrantPermission = false;
      if (await Geolocator.isLocationServiceEnabled()) {
        _mapCubit.onInitMap();
      } else {
        showNeedLocationPermission(
          onTapOpenPermission: () async {
            await Geolocator.openLocationSettings()
                .then((value) => isBackFromRequestOpenGPS = value);
            Navigator.pop(AppContext.navigatorKey.currentContext!);
          },
          locationType: LocationType.openGPS,
        );
      }
    }
    if (state == AppLifecycleState.resumed && isBackFromRequestOpenGPS) {
      isBackFromRequestOpenGPS = false;
      if (await Geolocator.isLocationServiceEnabled()) {
        var permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever) {
          _checkPermissionLocation();
        } else {
          _mapCubit.onInitMap();
        }
      }
    }
  }

  void _checkPermissionLocation() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      showNeedLocationPermission(
        onTapOpenPermission: () async {
          await AppSettings.openAppSettings();

          // await Geolocator.openLocationSettings()
          //     .then((value) => isBackFromRequestOpenGPS = value);
          Navigator.pop(AppContext.navigatorKey.currentContext!);
        },
        locationType: LocationType.openGPS,
      );
    } else {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever) {
          showNeedLocationPermission(
            onTapOpenPermission: () async {
              openAppSettings().then((value) {
                if (value) {
                  isBackFromGrantPermission = value;
                }
              });
              Navigator.pop(AppContext.navigatorKey.currentContext!);
            },
            locationType: LocationType.grantPermission,
          );
        }
      } else {
        _mapCubit.onInitMap();
      }
    }
  }

  @override
  void dispose() {
    _mapCubit.close();
    _mapCubit.searchController.clear();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapCubit, MapState>(
      listenWhen: (previous, current) =>
          previous.currentLocationUser != current.currentLocationUser,
      listener: (context, state) {
        _mapCubit.getListLocationMap(
            lat: state.currentLocationUser?.latitude.toString(),
            lon: state.currentLocationUser?.longitude.toString());
      },
      buildWhen: (previous, current) =>
          previous.onGetListLocationMap != current.onGetListLocationMap ||
          previous.listMaker != current.listMaker ||
          previous.onRequestFocusLocation != current.onRequestFocusLocation,
      builder: (context, state) {
        if (state.currentLocationUser == null) {
          return Container();
        }
        return GoogleMap(
          scrollGesturesEnabled: true,
          myLocationButtonEnabled: false,
          myLocationEnabled: false,
          mapType: MapType.normal,
          buildingsEnabled: true,
          zoomControlsEnabled: false,
          zoomGesturesEnabled: true,
          rotateGesturesEnabled: true,
          minMaxZoomPreference: const MinMaxZoomPreference(11, 25),
          markers: Set<Marker>.of(state.listMaker ?? []),
          initialCameraPosition: CameraPosition(
            target: LatLng(
                double.parse(
                    state.currentLocationUser?.latitude.toString() ?? '0'),
                double.parse(
                    state.currentLocationUser?.longitude.toString() ?? '0')),
            zoom: 14.0,
          ),
          // onTap: (argument) async {
          //   await _mapCubit.updateNearByShop(context);
          // },
          onMapCreated: (GoogleMapController controller) {
            _mapCubit.mapController.complete(controller);
          },
          onCameraIdle: () async {
            await _mapCubit.updateNearByShop(context);
          },
        );
      },
    );
  }
}
