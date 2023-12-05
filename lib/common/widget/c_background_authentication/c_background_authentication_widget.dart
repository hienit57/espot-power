import 'package:espot_power/common/index.dart';
import 'package:espot_power/extensions/app_context.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CBackgroundAuthWidget extends StatelessWidget {
  final bool? isPop;
  final Widget? child;

  const CBackgroundAuthWidget({
    super.key,
    this.isPop,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xFFFFCB04).withOpacity(0.3),
            Color(0xFFFFF9E3).withOpacity(0.3),
          ],
          stops: const [0.0123, 0.9768],
        ),
      ),
      child: Column(
        children: [
          if (isPop == true) ...[
            const SizedBox(height: 56),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: GestureDetector(
                onTap: () => AppContext.navigatorKey.currentContext!.pop(),
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
            const SizedBox(height: 64)
          ] else ...[
            const SizedBox(height: 108)
          ],
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 47),
            child: CImage(
              height: 90,
              assetsPath: AppAssets.imgLogoEspot,
            ),
          ),
          const SizedBox(height: 19),
          child ?? const SizedBox(),
          const Spacer(),
          const CPolicyWidget(),
        ],
      ),
    );
  }
}
