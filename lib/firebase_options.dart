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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDZIaFeauTOGwHpeaPFdELB4Y7K2QBd9VI',
    appId: '1:1039199279598:web:62ce10a4869c1c3563d6ff',
    messagingSenderId: '1039199279598',
    projectId: 'instagram-clone-65d8c',
    authDomain: 'instagram-clone-65d8c.firebaseapp.com',
    storageBucket: 'instagram-clone-65d8c.appspot.com',
    measurementId: 'G-N7VNNW8SGR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB1XXhFns608R7ZvHQD4gjeOhlw_-hDbRw',
    appId: '1:1039199279598:android:a1badcc3235c195c63d6ff',
    messagingSenderId: '1039199279598',
    projectId: 'instagram-clone-65d8c',
    storageBucket: 'instagram-clone-65d8c.appspot.com',
  );
}
