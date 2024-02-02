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
        return macos;
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
    apiKey: 'AIzaSyCBC-99au0LQ9rGhwKRXizH0QTn12wa9bE',
    appId: '1:159033422141:web:d4af7d660afb6bdbf51554',
    messagingSenderId: '159033422141',
    projectId: 'jumper-dates',
    authDomain: 'jumper-dates.firebaseapp.com',
    storageBucket: 'jumper-dates.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAXsYEs3gzdXfpAnvQf2MC0G189EQMu46c',
    appId: '1:159033422141:android:9d3b951bd259e85af51554',
    messagingSenderId: '159033422141',
    projectId: 'jumper-dates',
    storageBucket: 'jumper-dates.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAjD1B5pB5ftnmYf-rALvb0jSR-WX5nOPM',
    appId: '1:159033422141:ios:a910778242e3b367f51554',
    messagingSenderId: '159033422141',
    projectId: 'jumper-dates',
    storageBucket: 'jumper-dates.appspot.com',
    iosBundleId: 'com.example.jumperdates',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAjD1B5pB5ftnmYf-rALvb0jSR-WX5nOPM',
    appId: '1:159033422141:ios:84b7f003f6fcc8d0f51554',
    messagingSenderId: '159033422141',
    projectId: 'jumper-dates',
    storageBucket: 'jumper-dates.appspot.com',
    iosBundleId: 'com.example.jumperdates.RunnerTests',
  );
}
