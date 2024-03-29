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
    apiKey: 'AIzaSyAnOdBdUQJSpgVapBNPWmwBOprXq8hue_0',
    appId: '1:284528746072:web:3c4aaddeb8c46c4265f42d',
    messagingSenderId: '284528746072',
    projectId: 'getyoursuit',
    authDomain: 'getyoursuit.firebaseapp.com',
    storageBucket: 'getyoursuit.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCtcjdHoZGXO_O8i6WLMH9T5p1cAWutxyw',
    appId: '1:284528746072:android:e0f0364a3fd103a765f42d',
    messagingSenderId: '284528746072',
    projectId: 'getyoursuit',
    storageBucket: 'getyoursuit.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_2rv4JRJTH2InIv6XmIZB4YBO5yG4PCk',
    appId: '1:284528746072:ios:8d54fed9599e8bf965f42d',
    messagingSenderId: '284528746072',
    projectId: 'getyoursuit',
    storageBucket: 'getyoursuit.appspot.com',
    iosClientId: '284528746072-qvb7gjehabek45rlsfr19o7ub9dfdjvr.apps.googleusercontent.com',
    iosBundleId: 'com.example.getYourSuit',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB_2rv4JRJTH2InIv6XmIZB4YBO5yG4PCk',
    appId: '1:284528746072:ios:1e41c337e85bcbb565f42d',
    messagingSenderId: '284528746072',
    projectId: 'getyoursuit',
    storageBucket: 'getyoursuit.appspot.com',
    iosClientId: '284528746072-ajmaou8me552bm7u9n97b00d088kljk5.apps.googleusercontent.com',
    iosBundleId: 'com.example.getYourSuit.RunnerTests',
  );
}
