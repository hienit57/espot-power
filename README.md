* Generate localized keys
Command: flutter pub run easy_localization:generate -S "assets/localization" -f keys -o locale_keys.g.dart

* Generate JsonSeriable
Command: flutter pub run build_runner build --delete-conflicting-outputs

Firebase:
dart pub global activate flutterfire_cli

flutterfire configure

#Web
flutter build web --web-renderer canvaskit

//Build android app:
flutter build appbundle --release

//Upgrade version
flutter pub upgrade --major-versions

installl pod m1: arch -x86_64 pod install

#Alpha
flutter build apk lib/main.dart --debug

#Production
flutter build apk lib/main.dart --release

#Deploy Web
flutter clean
flutter pub get
flutter build web --web-renderer canvaskit --release
firebase deploy

