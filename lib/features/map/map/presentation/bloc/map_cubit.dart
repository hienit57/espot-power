import 'dart:async';
import 'dart:ui' as ui;

import 'package:espot_power/features/index.dart';
import 'package:espot_power/models/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:espot_power/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as userLocation;
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> with LoadingMixin, ToastMixin {
  MapCubit() : super(const MapState());

  late StreamController<StatusSliding> slidingController;
  final _selectedMarkerId = BehaviorSubject<String>.seeded('');

  double containerHeight = 172.0;
  CameraPosition cameraPosition = const CameraPosition(
      target: LatLng(21.016222443518657, 105.84860710277006), zoom: 14.0);

  Completer<GoogleMapController> mapController = Completer();
  List<Marker> markers = [];
  Position? currentPosition;
  BitmapDescriptor? pinLocationIcon;
  BitmapDescriptor? pinLocationIconSelected;
  BitmapDescriptor? currentLocationIcon;

  final searchController = TextEditingController();

  final _datasource = GetIt.instance<MapDatasourcesImpl>();

  void initData() {
    searchController.text = '';

    emit(state.copyWith(listLocationSearchResponse: []));
  }

  Future<void> currentLocationUser() async {
    final location = userLocation.Location();
    final currentLocation = await location.getLocation();
    emit(state.copyWith(currentLocationUser: currentLocation));
  }

  Future<void> onInitMap() async {
    //currentPosition ??= await requestPermission();
    int markerSize = 72;
    int markerSizeSelected = 72;

    logger.d('SIze $markerSize');
    Uint8List markerIcon =
        await getBytesFromAsset(AppAssets.iconMaker, markerSize);
    Uint8List markerIconSelected =
        await getBytesFromAsset(AppAssets.iconMakerZoom, markerSizeSelected);
    Uint8List currentLocation =
        await getBytesFromAsset(AppAssets.iconCurrentLocation, markerSize);

    pinLocationIcon = BitmapDescriptor.fromBytes(markerIcon);
    pinLocationIconSelected = BitmapDescriptor.fromBytes(markerIconSelected);
    currentLocationIcon = BitmapDescriptor.fromBytes(currentLocation);

    await currentLocationUser();

    if (state.listLocationMapResponse?.isEmpty ??
        false || state.listLocationMapResponse == null) {
      await getListLocationMap();
    }
  }

  Future<void> paramGetListLocationMap() async {
    final dataRequest = GetListLocationMapModelRequest(
      limit: 10000,
      distance: 300000,
      lat: '20.2263305',
      lon: '106.3349675',
    );
    emit(state.copyWith(paramGetListLocationMapRequest: dataRequest));
  }

  Future<void> getListLocationMap(
      {String? lat, String? lon, int? distance, int? limit}) async {
    emit(state.copyWith(onGetListLocationMap: RequestStatus.loading));

    try {
      ///TODO: ở đây chưa tối ưu là do bên BA của khách hàng đang muốn như thế này và BE quá ghẻ =)) (Méo phải do FE)

      // final dataRequest = GetListLocationMapModelRequest(
      //   limit: limit,
      //   distance: distance,
      //   //3000000,
      //   //7196,
      //   lat: lat,
      //   //'20.2263305',
      //   //lat,
      //   lon: lon,
      //   //'106.3349675'
      //   //lon,
      // );
      await paramGetListLocationMap();
      await _datasource
          .listLocationMap(state.paramGetListLocationMapRequest)
          .then((response) async {
        final dataResponse = (response.obj as List<dynamic>?)
            ?.map((item) =>
                LocationResponse.fromJson(item as Map<String, dynamic>))
            .toList();
        emit(
          state.copyWith(
            //listMaker: convertDataToMarkers(dataResponse),
            listLocationMapResponse: dataResponse,
            onGetListLocationMap: RequestStatus.success,
          ),
        );
      });
    } catch (e) {
      emit(state.copyWith(onGetListLocationMap: RequestStatus.failure));
    }
  }

  Future<void> updateNearByShop(BuildContext context) async {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final GoogleMapController controller = await mapController.future;

    LatLng newLatLng = await controller
        .getLatLng(ScreenCoordinate(x: width ~/ 2, y: height ~/ 2));

    ///TODO: ở đây chưa tối ưu là do bên BA của khách hàng đang muốn như thế này và BE quá ghẻ =)) (Méo phải do FE)

    if (state.listLocationMapResponse?.isEmpty ??
        false || state.listLocationMapResponse == null) {
      await getListLocationMap();
    }

    if (state.markerSelected == null) {
      emitListMakerMap(newLatLng);
    }
  }

  Future<Position> requestPermission() async {
    bool serviceEnabled;
    PermissionStatus permission;
    //emit(LoadingCurrentLocationState());
    serviceEnabled = await Permission.location.serviceStatus.isEnabled;
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Permission.location.status;
    if (permission == PermissionStatus.denied ||
        permission == PermissionStatus.permanentlyDenied) {
      permission = await Permission.location.request();
      if (permission == PermissionStatus.denied ||
          permission == PermissionStatus.permanentlyDenied) {
        //emit(LoadCurrentLocationDoneState());
        return Future.error('Location permissions are denied');
      }
    }
    final location = await Geolocator.getCurrentPosition();

    //emit(LoadCurrentLocationDoneState());
    return location;
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  ///Hàm lấy ra List Marker vì phải cấp lại List thì marker mới đổi màu sắc
  void emitListMakerMap(LatLng latLng) {
    List<Marker> markers = [];

    final markerNearest = markerNearestLocation(latLng);
    // LatLng positionMarketNearest =
    //     FormatUtils().caculateLatLng(markerNearest.lat, markerNearest.lng);

    for (var item in state.listLocationMapResponse!) {
      double lat = double.parse(item.lat ?? '0');
      double lng = double.parse(item.lng ?? '0');

      LatLng position = LatLng(lat, lng);

      Marker marker = Marker(
        icon: item.id.toString() == markerNearest.id.toString()
            ? pinLocationIconSelected!
            : pinLocationIcon!,
        markerId: MarkerId(item.id.toString()),
        position: position,
        onTap: () => emitListMakerMap(position),
        // infoWindow: InfoWindow(
        //   title: item.shopName,
        //   snippet: item.completeAddr,
        // ),
      );

      markers.add(marker);
    }
    if (isLatLngWithinRadius(latLng, 10000)) {
      markers.insert(0, currentMarker);
      emit(state.copyWith(listMaker: markers, markerSelected: markerNearest));
    } else {
      markers.insert(0, currentMarker);
      emit(state.copyWith(listMaker: markers, markerSelected: null));
    }
  }

  Future<void> updateCamera(LatLng latLng) async {
    logger.d("Change camera to: ${latLng.latitude} Long: ${latLng.longitude}");

    cameraPosition = CameraPosition(
        target: LatLng(latLng.latitude, latLng.longitude), zoom: 14);
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final GoogleMapController controller = await mapController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    });

    return;
  }

  ///Hàm swipe
  Future<void> emitLocationSwipe(bool? isSwipeLeft) async {
    if (isSwipeLeft == true) {
      int index = (state.listLocationMapResponse ?? [])
          .indexWhere((element) => element.id == state.markerSelected?.id);
      if (index >= 0) {
        index--;
        await updateCamera(FormatUtils().caculateLatLng(
            state.listLocationMapResponse?[index].lat,
            state.listLocationMapResponse?[index].lng));
        emitListMakerMap(FormatUtils().caculateLatLng(
            state.listLocationMapResponse?[index].lat,
            state.listLocationMapResponse?[index].lng));

        emit(state.copyWith(
            markerSelected: state.listLocationMapResponse?[index]));
      }
    } else {
      int index = (state.listLocationMapResponse ?? [])
          .indexWhere((element) => element.id == state.markerSelected?.id);
      if (index < (state.listLocationMapResponse?.length ?? 0)) {
        index++;
        await updateCamera(FormatUtils().caculateLatLng(
            state.listLocationMapResponse?[index].lat,
            state.listLocationMapResponse?[index].lng));
        emitListMakerMap(FormatUtils().caculateLatLng(
            state.listLocationMapResponse?[index].lat,
            state.listLocationMapResponse?[index].lng));

        emit(state.copyWith(
            markerSelected: state.listLocationMapResponse?[index]));
      }
    }
  }

  ///Force emit initial location
  Future<void> forceFocusUserLocation() async {
    emit(state.copyWith(onRequestFocusLocation: RequestFocusLocation.initial));
    try {
      final latLng = LatLng(
        state.currentLocationUser?.latitude ?? 0,
        state.currentLocationUser?.longitude ?? 0,
      );

      await updateCamera(latLng);
      emit(state.copyWith(
          markerSelected: LocationResponse(id: null),
          onRequestFocusLocation: RequestFocusLocation.success));
    } catch (e) {
      emit(
          state.copyWith(onRequestFocusLocation: RequestFocusLocation.failure));
    }
  }

  ///Hàm lấy ra location gần nhất để cắm marker
  LocationResponse markerNearestLocation(LatLng value) {
    final listLocationMapResponse = state.listLocationMapResponse;

    if (listLocationMapResponse?.isNotEmpty ?? false) {
      final data = listLocationMapResponse?.reduce((min, current) {
        final currentLatLng =
            FormatUtils().caculateLatLng(current.lat, current.lng);
        final minLatLng = FormatUtils().caculateLatLng(min.lat, min.lng);

        return FormatUtils().findShortestDistance(value, currentLatLng) <
                FormatUtils().findShortestDistance(value, minLatLng)
            ? current
            : min;
      });

      return data!;
    }
    return LocationResponse();
  }

  /// Hàm check xem nó có trong bán kính 10KM khoong
  bool isLatLngWithinRadius(LatLng value, double radiusInMeters) {
    final listLocationMapResponse = state.listLocationMapResponse;

    if (listLocationMapResponse?.isNotEmpty ?? false) {
      return listLocationMapResponse!.any((item) {
        double lat = double.parse(item.lat ?? '0');
        double lng = double.parse(item.lng ?? '0');
        LatLng currentLatLng = LatLng(lat, lng);
        return FormatUtils().findShortestDistance(value, currentLatLng) <=
            radiusInMeters;
      });
    }

    return false;
  }

  ///Custom Current Maker (Là Location của bạn)
  Marker get currentMarker {
    const MarkerId markerId = MarkerId('current_marker');

    final currentMarker = Marker(
      markerId: markerId,
      icon: currentLocationIcon!,
      position: LatLng(state.currentLocationUser?.latitude ?? 0,
          state.currentLocationUser?.longitude ?? 0),
      onDragEnd: (LatLng position) {
        // _onMarkerDragEnd(markerId, position);
      },
    );
    return currentMarker;
  }
}

///TODO:Optimize the Map section

//  Timer? _debounceTimer;
// Future<void> paramSearchRequest() async {
//   final dataRequest = SearchLocationModelRequest(
//     keyWord: searchController.text,
//     pageNo: 1,
//     pageSize: 20,
//     lat: '21.053356120970047',
//     lon: '105.80388469999998',
//   );
//   emit(state.copyWith(paramSearchRequest: dataRequest));
// }
// Future<void> onSearchLocation() async {
//   emit(state.copyWith(onSearchLocation: RequestStatus.loading));

//   try {
//     await paramSearchRequest();
//     await _datasource
//         .searchLocationNearMe(state.paramSearchRequest)
//         .then((response) async {
//       emit(
//         state.copyWith(
//           listLocationSearchResponse: response.obj as List<LocationResponse>,
//           onSearchLocation: RequestStatus.success,
//         ),
//       );
//     });
//   } catch (e) {
//     emit(state.copyWith(onSearchLocation: RequestStatus.failure));
//   }
// }
// Future<void> updateNearByShop(BuildContext context) async {
//   double width = MediaQuery.of(context).size.width;
//   double height = MediaQuery.of(context).size.height;
//   final GoogleMapController controller = await mapController.future;

//   LatLng newLatLng = await controller
//       .getLatLng(ScreenCoordinate(x: width ~/ 2, y: height ~/ 2));

//   await getListLocationMap(
//     lat: newLatLng.latitude.toString(),
//     lon: newLatLng.longitude.toString(),
//   );

//   emitMarkerSelected(newLatLng);
// }

// void onSearchChanged() {
//   if (_debounceTimer?.isActive ?? false) _debounceTimer?.cancel();

//   _debounceTimer = Timer(const Duration(milliseconds: 300), () {
//     onSearchLocation();
//   });
// }

//  Timer? _debounceTimerDragge;

// Future<void> onDaggleMap(BuildContext context) async {
//   if (_debounceTimerDragge?.isActive ?? false) _debounceTimerDragge?.cancel();

//   _debounceTimerDragge = Timer(const Duration(milliseconds: 300), () {
//     updateNearByShop(context);
//   });
// }
// void emitMarkerSelected(LatLng value) {
//   final listLocationMapResponse = state.listLocationMapResponse;

//   if (listLocationMapResponse?.isNotEmpty ?? false) {
//     final isExistLocation = listLocationMapResponse?.any((element) =>
//         FormatUtils().caculateLatLng(element.lat, element.lng) == value);

//     LatLng? autoSelectMakerWhenDraggle;

//     if (isExistLocation == false) {
//       final data = listLocationMapResponse?.reduce((min, current) {
//         final currentLatLng =
//             FormatUtils().caculateLatLng(current.lat, current.lng);
//         final minLatLng = FormatUtils().caculateLatLng(min.lat, min.lng);

//         return FormatUtils().findShortestDistance(value, currentLatLng) <
//                 FormatUtils().findShortestDistance(value, minLatLng)
//             ? current
//             : min;
//       });

//       autoSelectMakerWhenDraggle =
//           FormatUtils().caculateLatLng(data?.lat, data?.lng);
//       emit(state.copyWith(markerSelected: autoSelectMakerWhenDraggle));
//     } else {
//       emit(state.copyWith(markerSelected: value));
//     }
//   }
// }
