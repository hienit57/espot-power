import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:flutter/material.dart';

class ViewPersonalInformationPage extends StatelessWidget {
  const ViewPersonalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWrapperWidget(
      onPop: () {
        PersistentNavBarNavigator.pushNewScreen(
          AppContext.navigatorKey.currentContext!,
          screen: const HomePage(indexTab: 4),
          withNavBar: true,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
    );
  }
}
