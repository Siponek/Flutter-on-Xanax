// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:todoapp/config.dart' as config;

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
    log("ApiKey for firebase : ${config.googleApiKey}");
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static FirebaseOptions android = FirebaseOptions(
    apiKey: config.googleApiKey,
    appId: '1:113217835546:android:8cde370ef90c06772137a3',
    messagingSenderId: '113217835546',
    projectId: 'meta-xanax',
    storageBucket: 'meta-xanax.appspot.com',
  );

  static FirebaseOptions ios = FirebaseOptions(
    apiKey: config.googleApiKey,
    appId: '1:113217835546:ios:6ea25b7bb8f089282137a3',
    messagingSenderId: '113217835546',
    projectId: 'meta-xanax',
    storageBucket: 'meta-xanax.appspot.com',
    iosClientId:
        '113217835546-0bs0c818d8h1sgchp3l2r97ko4dssb31.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoapp',
  );
}
