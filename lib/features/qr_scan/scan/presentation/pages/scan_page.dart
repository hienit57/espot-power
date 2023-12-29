import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/routes/app_pages.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:espot_power/utils/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scan/scan.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  QRViewController? controller;
  late DashboardOrderCubit _dashboardOrderCubit;
  late ScanCubit _scanCubit;

  GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  void reassemble() {
    super.reassemble();
    if (defaultTargetPlatform == TargetPlatform.android) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  void initState() {
    _dashboardOrderCubit = BlocProvider.of<DashboardOrderCubit>(context);
    _scanCubit = BlocProvider.of<ScanCubit>(context);

    _scanCubit.initData();

    _dashboardOrderCubit.initData();
    _dashboardOrderCubit.getOrders();

    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;

    return BlocListener<DashboardOrderCubit, DashboardOrderState>(
      listenWhen: (previous, current) =>
          previous.ordersReponse != current.ordersReponse,
      listener: (context, state) {
        if (_scanCubit.isExistBatteryUnderway(state.ordersReponse ?? []) ==
            true) {
          NavigatorExt.pushAndRemoveUntil(
            context,
            ResultPage(
              isReserveColorButton: true,
              title: LocaleKeys.battery_rental_failed.tr(),
              icon: AppAssets.iconCheckOutFailed,
              customMessage: Padding(
                padding: const EdgeInsets.only(bottom: 36),
                child: CText(
                  text: LocaleKeys.error_quality_pin.tr(),
                  textAlign: TextAlign.center,
                ),
              ),
              paddingButton: 60,
              titleButtonOne: LocaleKeys.goback_home.tr(),
              titleButtonTwo: LocaleKeys.check_oder.tr(),
              onTapButtonOne: () {
                NavigatorExt.pushAndRemoveUntil(
                  AppContext.navigatorKey.currentContext!,
                  const HomePage(
                    indexTab: 0,
                    child: AllScreenHome.map,
                  ),
                  AppRoutes.qrScan,
                );
              },
              onTapButtonTwo: () {
                NavigatorExt.pushAndRemoveUntil(
                  AppContext.navigatorKey.currentContext!,
                  const HomePage(
                    indexTab: 1,
                    child: AllScreenHome.transaction,
                  ),
                  AppRoutes.qrScan,
                );
              },
            ),
            AppRoutes.qrScan,
          );
        }
      },
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: BlocListener<ScanCubit, ScanState>(
              listenWhen: (previous, current) =>
                  previous.onGetInformationChargingStation !=
                  current.onGetInformationChargingStation,
              listener: (context, state) {
                if (state.onGetInformationChargingStation ==
                    RequestStatus.success) {
                  NavigatorExt.pushAndRemoveUntil(
                    context,
                    OrderConfirmationPage(
                      informationChargingStationReponse:
                          state.informationChargingStationReponse,
                    ),
                    AppRoutes.qrScan,
                  );
                } else if (state.onGetInformationChargingStation ==
                    RequestStatus.failure) {
                  NavigatorExt.pushAndRemoveUntil(
                    context,
                    ChargingStationErrorPage(
                      informationChargingStationReponse:
                          state.informationChargingStationReponse,
                    ),
                    AppRoutes.qrScan,
                  );
                }
              },
              child: QRView(
                key: _scaffoldkey
                // defaultTargetPlatform == TargetPlatform.android
                //     ? _scaffoldkey
                //     : UniqueKey()

                ,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderColor: AppColors.colorFFCB05,
                  borderLength: 24,
                  borderWidth: 5,
                  cutOutSize: 0.32 * maxHeight,
                ),
                onPermissionSet: (ctrl, p) =>
                    _onPermissionSet(context, ctrl, p),
              ),
            ),
          ),
          _buildAuxiliaryWidget(),
        ],
      ),
    );
  }

  _buildAuxiliaryWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CText(
                text: LocaleKeys.message_move_camera_qr.tr(),
                fontSize: 13,
                textColor: AppColors.white,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: AuxiliaryFeatureWidget(
                      icon: AppAssets.iconScanFlash,
                      title: LocaleKeys.open_flash.tr(),
                      onTap: () async {
                        await controller?.toggleFlash();
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: AuxiliaryFeatureWidget(
                      icon: AppAssets.iconScanCamera,
                      title: LocaleKeys.front_camera.tr(),
                      onTap: () async {
                        await controller?.flipCamera();
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: AuxiliaryFeatureWidget(
                      icon: AppAssets.iconScanLibrary,
                      title: LocaleKeys.library.tr(),
                      onTap: () async {
                        await getFromGallery();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 64),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 113),
                child: CButton(
                  width: double.infinity,
                  height: 40,
                  radius: 10,
                  title: LocaleKeys.close.tr(),
                  titleColor: AppColors.colorText231F20,
                  titleFontWeight: FontWeight.w500,
                  backgroundColor: AppColors.colorFFCB05,
                  onPressed: () {
                    BlocProvider.of<HomeCubit>(context).emitIndexTabSelect(0,
                        screenForHome: AllScreenHome.map);
                  },
                ),
              ),
              const SizedBox(height: 51),
            ],
          ),
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    if (!kIsWeb) controller.resumeCamera();

    controller.scannedDataStream.listen((scanData) async {
      String? code = scanData.code ?? '';
      logger.d("Scan data $code");

      if (code.isNotEmpty) {
        var codeParse = code.split('/').last;
        if (codeParse.isNotEmpty) {
          await controller.pauseCamera();
          _scanCubit.emitQrCode(codeParse);
        }
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(LocaleKeys.access_camera_permission.tr())),
      );
    }
  }

  Future<void> getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    String path = pickedFile?.path ?? '';
    try {
      if (path.isNotEmpty) {
        final result = await Scan.parse(path);

        var id = result?.split('/').last;
        if (id?.isNotEmpty == true) {
          await controller?.pauseCamera();
          _scanCubit.emitQrCode(id!);
        }
        logger.d(id);
      }
    } catch (e) {
      logger.d(e);
    }
  }
}
