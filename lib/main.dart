import 'package:bas_clean_architecture/bloc_providers.dart';
import 'package:bas_clean_architecture/firebase_options.dart';
import 'package:bas_clean_architecture/index.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:url_strategy/url_strategy.dart';
import 'core/network/index.dart';
import 'service/firebase_auth/firebase_configuration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  //To handle http request for old android models
  HttpOverrides.global = MyHttpOverrides();

  //Config app env (API url)
  await AppEnviroment.instance.initialize();

  await FirebaseConfiguration().initFirebase();

  //Config firebase
  await initFirebase();
  //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await setupDi();

  configLoading();
  setPathUrlStrategy();

  // if (Platform.isIOS || Platform.isAndroid) {
  //   await FirebaseMessaging.instance.requestPermission(
  //     alert: true,
  //     badge: true,
  //     sound: true,
  //   );
  // }

  // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //   alert: true,
  //   badge: true,
  //   sound: true,
  // );
  // //Notification
  // NotificationHelper.configFCM();

  //Network
  ApiService().initialLizeNetworkSetting();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    Future.delayed(const Duration(seconds: 1), () {
      runApp(EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('zh')],
        path: 'assets/localization',
        fallbackLocale: const Locale('en'),
        child: MultiBlocProvider(
          providers: providers,
          child: const MainApplication(),
        ),
      ));
    });
  });
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

/// Create a [AndroidNotificationChannel] for heads up notifications
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // titledescription
  importance: Importance.high,
);

Future<void> initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await initFirebase();
//   MyLogger().d('Handling a background message ${message.messageId}');
// }

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
