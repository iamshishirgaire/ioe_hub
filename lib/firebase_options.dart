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
    apiKey: 'AIzaSyCnspQr18oYVQganZ8fDoXvpMc0EJUltZI',
    appId: '1:782215129652:web:09014867cab360c18a3861',
    messagingSenderId: '782215129652',
    projectId: 'ioe-hub-cbac8',
    authDomain: 'ioe-hub-cbac8.firebaseapp.com',
    storageBucket: 'ioe-hub-cbac8.appspot.com',
    measurementId: 'G-TTD4NL6GXK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBHIxZ4wT5DzmyV5qrHfttQVXLiTTbfN_0',
    appId: '1:782215129652:android:2ead57ee969202a78a3861',
    messagingSenderId: '782215129652',
    projectId: 'ioe-hub-cbac8',
    storageBucket: 'ioe-hub-cbac8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAeFNYFTdPygIx-MntYlUGu56XCFCO8y5s',
    appId: '1:782215129652:ios:06a3cc0e35bc03ee8a3861',
    messagingSenderId: '782215129652',
    projectId: 'ioe-hub-cbac8',
    storageBucket: 'ioe-hub-cbac8.appspot.com',
    iosBundleId: 'com.example.ioeHub',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAeFNYFTdPygIx-MntYlUGu56XCFCO8y5s',
    appId: '1:782215129652:ios:06a3cc0e35bc03ee8a3861',
    messagingSenderId: '782215129652',
    projectId: 'ioe-hub-cbac8',
    storageBucket: 'ioe-hub-cbac8.appspot.com',
    iosBundleId: 'com.example.ioeHub',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCnspQr18oYVQganZ8fDoXvpMc0EJUltZI',
    appId: '1:782215129652:web:636a2b40032fd3a08a3861',
    messagingSenderId: '782215129652',
    projectId: 'ioe-hub-cbac8',
    authDomain: 'ioe-hub-cbac8.firebaseapp.com',
    storageBucket: 'ioe-hub-cbac8.appspot.com',
    measurementId: 'G-PF7H75VKGE',
  );
}
