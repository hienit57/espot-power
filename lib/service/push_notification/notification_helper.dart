import 'package:bas_clean_architecture/utils/shared_pref_helpder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:bas_clean_architecture/utils/my_logger.dart';

class NotificationHelper {
  static RemoteMessage? fcmMessage;
  static bool fcmByBackGround = true;

  static void init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');

    /// Note: permissions aren't requested here just to demonstrate that can be
    /// done later
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:
          (int id, String? title, String? body, String? payload) async {},
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }

  static Future<void> showNotification(String? title, String? body,
      String notificationID, Map<String, dynamic> payload) async {
    try {
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails('your channel id', 'your channel name',
              importance: Importance.max,
              priority: Priority.high,
              //color: defaultColor,
              enableLights: true,
              largeIcon: DrawableResourceAndroidBitmap('ic_launcher'),
              ticker: 'ticker');
      const NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin
          .show(0, title, body, platformChannelSpecifics, payload: '$payload');
    } catch (e) {
      MyLogger().d('Show notification failed: ${e.toString()}');
    }
  }

  static void configFCM() {
    NotificationHelper.init();
    FirebaseMessaging.instance
        .getToken(
            vapidKey: kIsWeb
                ? "BNCYoXZ3RFqO4JZuHM8sxaApzUVJfZW26qwHyNsmlvCRWhGkSh3a31kLnfk-2cTi0-YDAM8QQ-YUcRBbidznKvY"
                : null)
        .then((value) => registerDeviceToken(value));
    foregroundReceiveFCM();
  }

  static void registerDeviceToken(String? fcmToken) async {
    if (fcmToken != null) {
      SharedPrefsHelper.saveFcmToken(fcmToken);
      MyLogger().d('Generated fcm token: $fcmToken');
    }
  }

  static void foregroundReceiveFCM() {
    FirebaseMessaging.instance.getInitialMessage().then(
          (value) => {
            handleClickFCM(value, from: 'foregroundReceiveFCM'),
          },
        );
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      handelFcmMessageForeground(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      MyLogger().d('handleClickFCM_onMessageOpenedApp: ${message.data}');
    });
  }

  static void handleClickFCM(RemoteMessage? message,
      {String from = '', bool isBackGround = true}) async {
    MyLogger().d('handleClickFCM_$from:_$isBackGround | ${message?.data}');
    fcmByBackGround = isBackGround;
    fcmMessage = message;
  }

  //MyProfile, Polls, Tasks, Events, Coupons
  static void handelFcmMessageForeground(RemoteMessage message) async {
    showNotification(message.notification?.title, message.notification?.body,
        '', message.data);
  }
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  MyLogger().d('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // titledescription
  importance: Importance.high,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
