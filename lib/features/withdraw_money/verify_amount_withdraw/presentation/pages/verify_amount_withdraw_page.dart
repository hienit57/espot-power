import 'package:espot_power/common/index.dart';
import 'package:espot_power/extensions/app_context.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:flutter/material.dart';

class VerifyAmountWithDrawPage extends StatelessWidget {
  const VerifyAmountWithDrawPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWrapperWidget(
      isViewSupportProblem: true,
      onReturn: () => NavigatorExt.pop(AppContext.navigatorKey.currentContext!),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Center(
            child: CText(
              text: LocaleKeys.withdraw_money.tr(),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
