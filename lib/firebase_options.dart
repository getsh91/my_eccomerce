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
    apiKey: 'AIzaSyC5kSdFbWgsqUxApToPDgWLoNgGONYxiTg',
    appId: '1:537212302920:web:9d6496efc324aaf4550a7d',
    messagingSenderId: '537212302920',
    projectId: 'e-commerce-app-5983a',
    authDomain: 'e-commerce-app-5983a.firebaseapp.com',
    storageBucket: 'e-commerce-app-5983a.appspot.com',
    measurementId: 'G-X6SX4FZJ4S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB3nZ2vI5LU1w8XpPZi65L01UlV50znjpg',
    appId: '1:537212302920:android:4a01b2d390c43e2a550a7d',
    messagingSenderId: '537212302920',
    projectId: 'e-commerce-app-5983a',
    storageBucket: 'e-commerce-app-5983a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAS3vkjIvGM-KKPoLYjX7feaCLxXh_L-0U',
    appId: '1:537212302920:ios:80a92a980d1d6e8a550a7d',
    messagingSenderId: '537212302920',
    projectId: 'e-commerce-app-5983a',
    storageBucket: 'e-commerce-app-5983a.appspot.com',
    androidClientId: '537212302920-rnh0ms49ktqdcipu2i3no36pmcerl3r7.apps.googleusercontent.com',
    iosClientId: '537212302920-bgof6g60ub9ejvka8nut03ml4s3m3imo.apps.googleusercontent.com',
    iosBundleId: 'com.example.tStore',
  );
}
