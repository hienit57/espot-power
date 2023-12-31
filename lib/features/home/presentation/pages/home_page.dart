import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/routes/app_pages.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final int? indexTab;
  final AllScreenHome? child;

  const HomePage({
    super.key,
    this.indexTab,
    this.child,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with LoadingMixin {
  late HomeCubit _homeCubit;

  @override
  void initState() {
    _homeCubit = BlocProvider.of<HomeCubit>(context);
    _homeCubit.emitIndexTabSelect(
      widget.indexTab ?? 0,
      screenForHome: widget.child ?? AllScreenHome.map,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.indexSelectTab != current.indexSelectTab ||
          previous.screenForHome != current.screenForHome,
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              color: AppColors.white,
              child: SafeArea(
                top: false,
                bottom:
                    state.screenForHome != AllScreenHome.qrScan ? true : false,
                child: Column(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: (() {
                          switch (state.screenForHome) {
                            case AllScreenHome.map:
                              return const MapPage();
                            case AllScreenHome.transaction:
                              return const DashboardTransactionPage();
                            case AllScreenHome.qrScan:
                              return const ScanPage();
                            case AllScreenHome.notification:
                              return const NotificationPage();
                            case AllScreenHome.profile:
                              return DashboardProfilePage(
                                onSetLocaleVi: () =>
                                    context.setLocale(const Locale('vi')),
                                onSetLocaleEn: () =>
                                    context.setLocale(const Locale('en')),
                              );
                            case AllScreenHome.detailOrder:
                              return const DetailOrderPage();
                            case AllScreenHome.historyTransaction:
                              return const HistoryTransactionPage();
                            case AllScreenHome.detailsLocation:
                              return const DetailsLocationPage();
                            default:
                              break;
                          }
                        }()),
                      ),
                    ),
                    if (state.screenForHome != AllScreenHome.qrScan) ...[
                      _buildBottomTab()
                    ]
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _buildBottomTab() {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.indexSelectTab != current.indexSelectTab ||
          previous.screenForHome != current.screenForHome,
      builder: (context, state) {
        return Container(
          height: 72,
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: const [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 10,
                spreadRadius:
                    -5, // Điều này làm cho shadow chỉ mở rộng lên phía trên
                offset: Offset(0, -5),
              ),
            ],
          ),
          child: Row(children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => _homeCubit.emitIndexTabSelect(
                0,
                screenForHome: AllScreenHome.map,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: CustomIconTabbarWidget(
                  isCheck: state.indexSelectTab == 0,
                  icon: AppAssets.iconTabbarMapUnChecked,
                  name: LocaleKeys.map.tr(),
                ),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => _homeCubit.emitIndexTabSelect(
                1,
                screenForHome: AllScreenHome.transaction,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: CustomIconTabbarWidget(
                  isCheck: state.indexSelectTab == 1,
                  icon: AppAssets.iconTabbarOrderUnChecked,
                  name: LocaleKeys.transaction.tr(),
                ),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => _homeCubit.emitIndexTabSelect(
                2,
                screenForHome: AllScreenHome.qrScan,
              ),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width / 5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.colorFFCB05,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: CImage(
                    assetsPath: AppAssets.iconTabbarScan,
                    boxFit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => _homeCubit.emitIndexTabSelect(
                3,
                screenForHome: AllScreenHome.notification,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: CustomIconTabbarWidget(
                  isCheck: state.indexSelectTab == 3,
                  icon: AppAssets.iconTabbarNotifiUnChecked,
                  name: LocaleKeys.notification.tr(),
                ),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => _homeCubit.emitIndexTabSelect(
                4,
                screenForHome: AllScreenHome.profile,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: CustomIconTabbarWidget(
                  isCheck: state.indexSelectTab == 4,
                  icon: AppAssets.iconTabbarProfileUnChecked,
                  name: LocaleKeys.account.tr(),
                ),
              ),
            ),
          ]),
        );
      },
    );
  }
}
