import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/features/profile/information_and_support_center/presentation/pages/information_and_support_center_page.dart';
import 'package:espot_power/index.dart';
import 'package:flutter/material.dart';

class SupportWebviewPage extends StatelessWidget {
  final String? url;

  const SupportWebviewPage({
    super.key,
    this.url,
  });

  @override
  Widget build(BuildContext context) {
    return BaseWrapperWidget(
      onReturn: () {
        NavigatorExt.push(
          AppContext.navigatorKey.currentContext!,
          const InformationAndSupportCenterPage(),
        );
      },
      child: Expanded(child: CWebviewWidget(url: url ?? '')),
    );
  }
}
