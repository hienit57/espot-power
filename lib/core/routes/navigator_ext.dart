import 'package:flutter/material.dart';

class NavigatorExt {
  //static const String Root = '/';

  /*
  * context
  * if need show bottomNavBar -> context = current screen context
  * else -> context = application context
  * */
  static Future<T?> push<T extends Object>(BuildContext context, Widget screen,
      {String? routeName}) async {
    return await Navigator.of(context).push(
      MaterialPageRoute<T>(
        builder: (context) => screen,
        settings: RouteSettings(name: routeName),
      ),
    );
  }

  static Future<T?> pushAndReplace<T extends Object>(
      BuildContext context, Widget screen,
      {String? routeName}) async {
    return await Navigator.of(context).pushReplacement(
      MaterialPageRoute<T>(
        builder: (context) => screen,
        settings: RouteSettings(name: routeName),
      ),
    );
  }

  static Future<T?> pushAndClearAll<T extends Object>(
      BuildContext context, Widget screen,
      {String? routeName}) async {
    return await Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<T>(
        builder: (context) => screen,
        settings: RouteSettings(name: routeName),
      ),
      (route) => false,
    );
  }

  static Future<T?> pushAndRemoveUntil<T extends Object>(
      BuildContext context, Widget screen, String untilRouteName,
      {String? routeName}) async {
    return await Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<T>(
        builder: (context) => screen,
        settings: RouteSettings(name: routeName),
      ),
      (route) => route.settings.name == untilRouteName,
    );
  }

  static pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static popUntil(BuildContext context, String untilRouteName) {
    Navigator.of(context)
        .popUntil((route) => route.settings.name == untilRouteName);
  }

  /*
  * We can use the same function on Application, like this:
  * sl.get<Application>().getApplicationContext()
  * */
  static BuildContext getApplicationContext(BuildContext context) {
    return Navigator.of(context, rootNavigator: true).context;
  }

  /*
  * We can use the same function on Application, like this:
  * sl.get<Application>().getApplicationOverlayContext()
  * */
  static BuildContext? getApplicationOverlayContext(BuildContext context) {
    return Navigator.of(context, rootNavigator: true).overlay?.context;
  }
}
