import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final int? indexTab;
  const HomePage({
    super.key,
    this.indexTab,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with LoadingMixin {
  late HomeCubit _homeCubit;

  late PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: widget.indexTab ?? 0);

    _homeCubit = BlocProvider.of<HomeCubit>(context);
    _homeCubit.emitIndexTabSelect(widget.indexTab ?? 0);
    super.initState();
  }

  List<PersistentBottomNavBarItem>? items(
          BuildContext context, HomeState state) =>
      [
        PersistentBottomNavBarItem(
          icon: CustomIconTabbarWidget(
            isCheck: state.indexSelectTab == 0,
            icon: AppAssets.iconTabbarMapUnChecked,
            name: LocaleKeys.map.tr(),
          ),
          activeColorPrimary: CupertinoColors.white,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: CustomIconTabbarWidget(
            isCheck: state.indexSelectTab == 1,
            icon: AppAssets.iconTabbarOrderUnChecked,
            name: LocaleKeys.transaction.tr(),
          ),
          activeColorPrimary: CupertinoColors.white,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.colorFFCB05,
              ),
              child: const Padding(
                padding: EdgeInsets.all(9.0),
                child: CImage(
                  assetsPath: AppAssets.iconTabbarScan,
                  boxFit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        PersistentBottomNavBarItem(
          icon: CustomIconTabbarWidget(
            isCheck: state.indexSelectTab == 3,
            icon: AppAssets.iconTabbarNotifiUnChecked,
            name: LocaleKeys.notification.tr(),
          ),
          activeColorPrimary: CupertinoColors.white,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: CustomIconTabbarWidget(
            isCheck: state.indexSelectTab == 4,
            icon: AppAssets.iconTabbarProfileUnChecked,
            name: LocaleKeys.account.tr(),
          ),
          activeColorPrimary: CupertinoColors.white,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.indexSelectTab != current.indexSelectTab,
      builder: (context, state) {
        return PersistentTabView(
          context,
          controller: _controller,
          screens: [
            Container(
              child: Center(
                child: CText(
                  text: LocaleKeys.map.tr(),
                ),
              ),
            ),
            Container(
              child: Center(
                child: CText(
                  text: LocaleKeys.order.tr(),
                ),
              ),
            ),
            Container(
              child: Center(
                child: CText(
                  text: 'QR Scan',
                ),
              ),
            ),
            Container(
              child: Center(
                child: CText(
                  text: LocaleKeys.notification.tr(),
                ),
              ),
            ),
            DashboardProfilePage(
              onSetLocaleVi: () => context.setLocale(Locale('vi')),
              onSetLocaleEn: () => context.setLocale(Locale('en')),
            ),
          ],
          padding: const NavBarPadding.all(0),
          bottomScreenMargin: 0,
          onItemSelected: (value) {
            _homeCubit.emitIndexTabSelect(value);
          },
          items: items(context, state),
          confineInSafeArea: true,
          backgroundColor: Colors.white, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset:
              true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows:
              true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle
              .style6, // Choose the nav bar style with this property.
        );
      },
    );
  }
}
