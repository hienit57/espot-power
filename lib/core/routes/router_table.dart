import 'package:bas_clean_architecture/common/global/index.dart';
import 'package:bas_clean_architecture/core/routes/index.dart';
import 'package:bas_clean_architecture/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:bas_clean_architecture/features/login/index.dart';
import 'package:flutter/material.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final inAppNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter routerConfig = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Dashboard.routeName,
  redirect: (context, state) async {
    final accessToken =
        (await DataUserLoginCachedClient.instance.getData())?.token;

    if (accessToken == null) {
      return LoginPage.routeName;
    }
    return state.path;
  },
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: inAppNavigatorKey,
      builder: (context, state, child) {
        return GlobalPage(child: child);
      },
      routes: [
        GoRoute(
            parentNavigatorKey: inAppNavigatorKey,
            path: Dashboard.routeName,
            pageBuilder: ((context, state) => const NoTransitionPage(
                  child: Dashboard(),
                )),
            routes: [
              // GoRoute(
              //   parentNavigatorKey: inAppNavigatorKey,
              //   path: pathFormat(DashboardAppointmentsPage.routeName),
              //   pageBuilder: ((context, state) => const NoTransitionPage(
              //         child: DashboardAppointmentsPage(),
              //       )),
              // ),
            ]),
      ],
    ),
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: LoginPage.routeName,
      pageBuilder: ((context, state) => const NoTransitionPage(
            child: LoginPage(),
          )),
    ),
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: ForgotPasswordPage.routeName,
      pageBuilder: ((context, state) => const NoTransitionPage(
            child: ForgotPasswordPage(),
          )),
    ),
  ],
);

String pathFormat(String path) {
  return path.replaceAll('/', '');
}
