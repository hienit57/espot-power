import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/home/data/models/tabbar_action_model.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

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

  final screens = [
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
    DashboardProfilePage(),
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
          screens: screens,
          padding: const NavBarPadding.all(0),
          bottomScreenMargin: 0,
          onItemSelected: (value) {
            _homeCubit.emitIndexTabSelect(value);
          },
          items: listTabbarActionModel.map((element) {
            if (element == listTabbarActionModel[2]) {
              return PersistentBottomNavBarItem(
                icon: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.colorFFCB05,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: CImage(
                        assetsPath: element.icon,
                        boxFit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              );
            }
            return PersistentBottomNavBarItem(
              icon: CustomIconTabbarWidget(
                isCheck: state.indexSelectTab == element.index,
                icon: element.icon,
                name: element.name,
              ),
              activeColorPrimary: CupertinoColors.white,
              inactiveColorPrimary: CupertinoColors.systemGrey,
            );
          }).toList(),
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
