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
    apiKey: 'AIzaSyAoXl2N6gnFSxgBRe9CSive7BpvdUsg5xo',
    appId: '1:327673444953:web:62577c621ffe84d0a2cf48',
    messagingSenderId: '327673444953',
    projectId: 'e-commerce-h',
    authDomain: 'e-commerce-h.firebaseapp.com',
    storageBucket: 'e-commerce-h.appspot.com',
    measurementId: 'G-TWNFVZ47RJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBDEVLFbPYXzQnGPHjOEg4im_rQLGWyUuk',
    appId: '1:327673444953:android:ece3575a13f7796aa2cf48',
    messagingSenderId: '327673444953',
    projectId: 'e-commerce-h',
    storageBucket: 'e-commerce-h.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBLBPrCh3neMsun7txKy2ccOMP6LXmOnEY',
    appId: '1:327673444953:ios:297bee981727e961a2cf48',
    messagingSenderId: '327673444953',
    projectId: 'e-commerce-h',
    storageBucket: 'e-commerce-h.appspot.com',
    iosBundleId: 'com.example.eCommerceh',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBLBPrCh3neMsun7txKy2ccOMP6LXmOnEY',
    appId: '1:327673444953:ios:8030e2acb938ffcea2cf48',
    messagingSenderId: '327673444953',
    projectId: 'e-commerce-h',
    storageBucket: 'e-commerce-h.appspot.com',
    iosBundleId: 'com.example.eCommerceh.RunnerTests',
  );
}
