// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAKTKjeN8VA60Z87ntIvFFuzZ0sJTY-XGw',
    appId: '1:369561580249:web:42f9449b5b8078152244c8',
    messagingSenderId: '369561580249',
    projectId: 'first-app-e49a0',
    authDomain: 'first-app-e49a0.firebaseapp.com',
    databaseURL: 'https://first-app-e49a0-default-rtdb.firebaseio.com',
    storageBucket: 'first-app-e49a0.firebasestorage.app',
    measurementId: 'G-BSEYVVWLC4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDntGCUO9PDuJguyrXK6aCQi168HjiUaYc',
    appId: '1:369561580249:android:0eccc4eafbb08fa22244c8',
    messagingSenderId: '369561580249',
    projectId: 'first-app-e49a0',
    databaseURL: 'https://first-app-e49a0-default-rtdb.firebaseio.com',
    storageBucket: 'first-app-e49a0.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBH9DnDxxkAneAAVtibsW623lnvd_Q2pYg',
    appId: '1:369561580249:ios:717a718cbb3841602244c8',
    messagingSenderId: '369561580249',
    projectId: 'first-app-e49a0',
    databaseURL: 'https://first-app-e49a0-default-rtdb.firebaseio.com',
    storageBucket: 'first-app-e49a0.firebasestorage.app',
    iosBundleId: 'com.example.aplikasiDaftarBelanja',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBH9DnDxxkAneAAVtibsW623lnvd_Q2pYg',
    appId: '1:369561580249:ios:717a718cbb3841602244c8',
    messagingSenderId: '369561580249',
    projectId: 'first-app-e49a0',
    databaseURL: 'https://first-app-e49a0-default-rtdb.firebaseio.com',
    storageBucket: 'first-app-e49a0.firebasestorage.app',
    iosBundleId: 'com.example.aplikasiDaftarBelanja',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAKTKjeN8VA60Z87ntIvFFuzZ0sJTY-XGw',
    appId: '1:369561580249:web:c20ef7eacdf86f902244c8',
    messagingSenderId: '369561580249',
    projectId: 'first-app-e49a0',
    authDomain: 'first-app-e49a0.firebaseapp.com',
    databaseURL: 'https://first-app-e49a0-default-rtdb.firebaseio.com',
    storageBucket: 'first-app-e49a0.firebasestorage.app',
    measurementId: 'G-Q92NW00E6X',
  );
}
