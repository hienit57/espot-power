import 'package:espot_power/core/local_data/pref_utils.dart';
import 'package:espot_power/core/routes/app_routes.dart';
import 'package:espot_power/index.dart';
import 'package:flutter/material.dart';

import 'core/routes/app_pages.dart';
import 'features/index.dart';

class MainApplication extends StatelessWidget with PreferencesUtil {
  const MainApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: FutureBuilder<bool>(
          future: OnboardingCubit().isLogin(),
          builder: (context, snapshotUser) {
            return FutureBuilder<bool>(
                future: OnboardingCubit().emitShowOnboarding(),
                builder: (context, snapshot) {
                  return MaterialApp(
                    localizationsDelegates: context.localizationDelegates,
                    supportedLocales: context.supportedLocales,
                    debugShowCheckedModeBanner: false,
                    title: 'Main Application',
                    locale: context.locale,
                    routes: AppPages.getPages(context),
                    onGenerateRoute: AppPages.generateRoute,
                    navigatorKey: AppContext.navigatorKey,
                    // theme: ThemeData(
                    //   useMaterial3: true,
                    //   // colorScheme: lightColorScheme,
                    //   colorSchemeSeed: Colors.blue,
                    //   visualDensity: VisualDensity.adaptivePlatformDensity,
                    // ),
                    // darkTheme: ThemeData(
                    //   useMaterial3: true,
                    // ),
                    // themeMode: ThemeMode.light,
                    initialRoute: (() {
                      if (snapshotUser.data == true) {
                        return AppRoutes.home;
                      }
                      if (snapshot.data == true) {
                        return AppRoutes.verifyUserExists;
                      }
                      return AppRoutes.onboarding;
                    }()),
                    builder: EasyLoading.init(),
                  );
                });
          }),
    );
  }
}
