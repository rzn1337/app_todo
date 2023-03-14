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
    apiKey: 'AIzaSyDsmy7_zvEtQKgx0-K2KJtf6UkfzWBlRIs',
    appId: '1:1007258137612:web:26aeb35b71679082c46a29',
    messagingSenderId: '1007258137612',
    projectId: 'todo-app-ad580',
    authDomain: 'todo-app-ad580.firebaseapp.com',
    storageBucket: 'todo-app-ad580.appspot.com',
    measurementId: 'G-5BM7P39191',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAcpHdo6FH_Y7E6XnxbQb5lg7BpC3QNI2M',
    appId: '1:1007258137612:android:812e19c38edab2a3c46a29',
    messagingSenderId: '1007258137612',
    projectId: 'todo-app-ad580',
    storageBucket: 'todo-app-ad580.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCHNSwDaQmSPlzp5S61XkewNyBBw_GF8T0',
    appId: '1:1007258137612:ios:2ca9edff8befb089c46a29',
    messagingSenderId: '1007258137612',
    projectId: 'todo-app-ad580',
    storageBucket: 'todo-app-ad580.appspot.com',
    androidClientId: '1007258137612-b4v85ikfvvg5kt1vhcreof0htbgvl3ge.apps.googleusercontent.com',
    iosClientId: '1007258137612-d10u1f4t9bi6lv0gt9uofgi6nol73g9u.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCHNSwDaQmSPlzp5S61XkewNyBBw_GF8T0',
    appId: '1:1007258137612:ios:2ca9edff8befb089c46a29',
    messagingSenderId: '1007258137612',
    projectId: 'todo-app-ad580',
    storageBucket: 'todo-app-ad580.appspot.com',
    androidClientId: '1007258137612-b4v85ikfvvg5kt1vhcreof0htbgvl3ge.apps.googleusercontent.com',
    iosClientId: '1007258137612-d10u1f4t9bi6lv0gt9uofgi6nol73g9u.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoApp',
  );
}