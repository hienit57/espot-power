import 'package:espot_power/common/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class BaseWrapperWidget extends StatelessWidget {
  final VoidCallback? onReturn;
  final Widget? child;
  const BaseWrapperWidget({
    super.key,
    this.onReturn,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 58),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: GestureDetector(
              onTap: onReturn,
              child: Row(
                children: [
                  const CImage(
                    assetsPath: AppAssets.iconArrow,
                    width: 24,
                    height: 24,
                  ),
                  Container(width: 8),
                  CText(
                    textAlign: TextAlign.center,
                    lineSpacing: 1.2,
                    text: LocaleKeys.returns.tr(),
                  ),
                ],
              ),
            ),
          ),
          child ?? const SizedBox.shrink()
        ],
      ),
    );
  }
}
