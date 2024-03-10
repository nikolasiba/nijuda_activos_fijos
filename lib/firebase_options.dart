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
    apiKey: 'AIzaSyBB83VzG_o5koL5kxlV6rAOhnEFmoGlie4',
    appId: '1:1014677944281:web:6ee90b4003efd0be0d4bc8',
    messagingSenderId: '1014677944281',
    projectId: 'nijuda',
    authDomain: 'nijuda.firebaseapp.com',
    storageBucket: 'nijuda.appspot.com',
    measurementId: 'G-DF27BE9179',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBtMSKtoRkfsMgS-7MDYn6I9r1Fiz1-YKI',
    appId: '1:1014677944281:android:32a1076b15d7a4de0d4bc8',
    messagingSenderId: '1014677944281',
    projectId: 'nijuda',
    storageBucket: 'nijuda.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_0gstVlwrxpgGE8kfLRkVn-M0GeBMnYI',
    appId: '1:1014677944281:ios:56e8bedecb2b5b770d4bc8',
    messagingSenderId: '1014677944281',
    projectId: 'nijuda',
    storageBucket: 'nijuda.appspot.com',
    iosBundleId: 'co.nijuda.activosfijos',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB_0gstVlwrxpgGE8kfLRkVn-M0GeBMnYI',
    appId: '1:1014677944281:ios:12551c4f134045970d4bc8',
    messagingSenderId: '1014677944281',
    projectId: 'nijuda',
    storageBucket: 'nijuda.appspot.com',
    iosBundleId: 'co.nijuda.activosfijos.RunnerTests',
  );
}