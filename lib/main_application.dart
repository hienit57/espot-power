import 'package:bas_clean_architecture/core/local_data/pref_utils.dart';
import 'package:bas_clean_architecture/index.dart';
import 'package:flutter/material.dart';

import 'core/routes/router_table.dart';

class MainApplication extends StatelessWidget with PreferencesUtil {
  const MainApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1440, 1080),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GestureDetector(
            onTap: () {
              FocusScopeNode focus = FocusScope.of(context);
              if (!focus.hasPrimaryFocus && focus.focusedChild != null) {
                focus.focusedChild?.unfocus();
              }
            },
            child: MaterialApp.router(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              builder: EasyLoading.init(),

              debugShowCheckedModeBanner: false,
              title: 'Main Application',
              routerConfig: routerConfig,
              theme: ThemeData(
                useMaterial3: true,
                // colorScheme: lightColorScheme,
                colorSchemeSeed: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              darkTheme: ThemeData(
                useMaterial3: true,
              ),
              themeMode: ThemeMode.light, // Default is system
            ),
          );
        });
  }
}
