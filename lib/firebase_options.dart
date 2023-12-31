// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyBwkwJO1bQko1-mbJAcfYNgjlTLMC4i_sQ",
    authDomain: "espot-power.firebaseapp.com",
    projectId: "espot-power",
    storageBucket: "espot-power.appspot.com",
    messagingSenderId: "568203469920",
    appId: "1:568203469920:web:569e4525b061e93be60f05",
    measurementId: "G-R9RPEEGDKW",
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBh8BwMnwu8MtHev-BzMMmiAjoAH5TcVuA',
    appId: '1:568203469920:android:53029f6db9beac22e60f05',
    messagingSenderId: '568203469920',
    projectId: 'espot-power',
    storageBucket: 'espot-power.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBS3dP0xrmRhor25RF7rkuZEWXTTqKFxaY',
    appId: '1:568203469920:ios:51f0d21e7ec37665e60f05',
    messagingSenderId: '568203469920',
    projectId: 'espot-power',
    storageBucket: 'espot-power.appspot.com',
    androidClientId:
        '568203469920-85ab5uroik9elvdpqoce4fvpkakicj35.apps.googleusercontent.com',
    iosClientId:
        '568203469920-jqauun28empq66dm7fk5bm0981d1856m.apps.googleusercontent.com',
    iosBundleId: 'com.espot.power',
  );
}
