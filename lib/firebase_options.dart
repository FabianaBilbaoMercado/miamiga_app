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
    apiKey: 'AIzaSyAKI2QyqDrxXsMy77P1ExagP59uuNMMMEM',
    appId: '1:1024496648729:web:b91fcc6137447a35baa088',
    messagingSenderId: '1024496648729',
    projectId: 'authprueba-e040e',
    authDomain: 'authprueba-e040e.firebaseapp.com',
    storageBucket: 'authprueba-e040e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC_LsFy9JQkxrK5wk0tfQj_qBF4lOkiEhI',
    appId: '1:1024496648729:android:a18235f6f7793d72baa088',
    messagingSenderId: '1024496648729',
    projectId: 'authprueba-e040e',
    storageBucket: 'authprueba-e040e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA7ZJgxjKzgMr-4dDKePLPOPMU50e9-z20',
    appId: '1:1024496648729:ios:ff9a9bfb8719dfabbaa088',
    messagingSenderId: '1024496648729',
    projectId: 'authprueba-e040e',
    storageBucket: 'authprueba-e040e.appspot.com',
    androidClientId: '1024496648729-g8kmi0sc5h6a7ti923jppn0qqrnepjen.apps.googleusercontent.com',
    iosClientId: '1024496648729-uf3pa2ples1qbkf4mp5gmpaqkav2r9cv.apps.googleusercontent.com',
    iosBundleId: 'com.example.miamigaApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA7ZJgxjKzgMr-4dDKePLPOPMU50e9-z20',
    appId: '1:1024496648729:ios:ff9a9bfb8719dfabbaa088',
    messagingSenderId: '1024496648729',
    projectId: 'authprueba-e040e',
    storageBucket: 'authprueba-e040e.appspot.com',
    androidClientId: '1024496648729-g8kmi0sc5h6a7ti923jppn0qqrnepjen.apps.googleusercontent.com',
    iosClientId: '1024496648729-uf3pa2ples1qbkf4mp5gmpaqkav2r9cv.apps.googleusercontent.com',
    iosBundleId: 'com.example.miamigaApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAKI2QyqDrxXsMy77P1ExagP59uuNMMMEM',
    appId: '1:1024496648729:web:04b73655e6c98592baa088',
    messagingSenderId: '1024496648729',
    projectId: 'authprueba-e040e',
    authDomain: 'authprueba-e040e.firebaseapp.com',
    storageBucket: 'authprueba-e040e.appspot.com',
  );

}