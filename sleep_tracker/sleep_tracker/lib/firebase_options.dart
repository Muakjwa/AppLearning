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
    apiKey: 'AIzaSyAfu6vF2tfaRv0frPIbfQ98TrG6vS8yLzs',
    appId: '1:400633001191:web:5872ee66186a8c0c485e42',
    messagingSenderId: '400633001191',
    projectId: 'sleep-tracker-9929f',
    authDomain: 'sleep-tracker-9929f.firebaseapp.com',
    storageBucket: 'sleep-tracker-9929f.appspot.com',
    measurementId: 'G-626JRGH8G4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBgpOb-CL9kR4jHsYXn7YDIqKIof1XM-Nc',
    appId: '1:400633001191:android:0a98d8878d713add485e42',
    messagingSenderId: '400633001191',
    projectId: 'sleep-tracker-9929f',
    storageBucket: 'sleep-tracker-9929f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBEqkrJu4PE6u_PyF9YBBXgZyEzi4L9ino',
    appId: '1:400633001191:ios:4b9e754527702296485e42',
    messagingSenderId: '400633001191',
    projectId: 'sleep-tracker-9929f',
    storageBucket: 'sleep-tracker-9929f.appspot.com',
    iosClientId: '400633001191-cc6ec1nhjehlk7cmspscps3hlpv531n3.apps.googleusercontent.com',
    iosBundleId: 'com.example.sleepTrackerCloning',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBEqkrJu4PE6u_PyF9YBBXgZyEzi4L9ino',
    appId: '1:400633001191:ios:46fedc910f8390eb485e42',
    messagingSenderId: '400633001191',
    projectId: 'sleep-tracker-9929f',
    storageBucket: 'sleep-tracker-9929f.appspot.com',
    iosClientId: '400633001191-90t9l45a92m5j2pnt3ehu7kqui93eh5k.apps.googleusercontent.com',
    iosBundleId: 'com.example.sleepTrackerCloning.RunnerTests',
  );
}
