import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget large;
  final Widget normal;
  final Widget small;

  const Responsive({
    Key? key,
    required this.large,
    required this.normal,
    required this.small,
  }) : super(key: key);

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop help us later
  static bool isSmall(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isNormal(BuildContext context) =>
      MediaQuery.of(context).size.width < 1440 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isLarge(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1440;

  static bool isPriority(BuildContext context) =>
      MediaQuery.of(context).size.width <= 1100;

  // static bool isBigScreenPhone(BuildContext context) =>
  //     MediaQuery.of(context).size.width >= 750;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // If our width is more than 1100 then we consider it a desktop
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1440) {
          return large;
        }
        // If width it less then 1100 and more then 650 we consider it as tablet
        else if (constraints.maxWidth >= 650) {
          return normal;
        }
        // Or less then that we called it mobile
        else {
          return small;
        }
      },
    );
  }
}
