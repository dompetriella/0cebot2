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
    apiKey: 'AIzaSyCTmEPIbcglHuNgZh-N89bBfxpj3mXWn4g',
    appId: '1:191716262966:web:6f4557f79a1dfd55a50497',
    messagingSenderId: '191716262966',
    projectId: 'ocebot-8526f',
    authDomain: 'ocebot-8526f.firebaseapp.com',
    storageBucket: 'ocebot-8526f.appspot.com',
    measurementId: 'G-VGNV09XXF4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBASa2a4MWrwcQ8QRs5s6JW9bWwPgA7w2w',
    appId: '1:191716262966:android:1958c963ea78f8d0a50497',
    messagingSenderId: '191716262966',
    projectId: 'ocebot-8526f',
    storageBucket: 'ocebot-8526f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDmFf5Q7ytvBKdDyWraN_IQJ8kEHv608tU',
    appId: '1:191716262966:ios:3755bf17fdb78084a50497',
    messagingSenderId: '191716262966',
    projectId: 'ocebot-8526f',
    storageBucket: 'ocebot-8526f.appspot.com',
    iosClientId: '191716262966-hbjbahtmdqh0b48eon72cog3mjsee0kc.apps.googleusercontent.com',
    iosBundleId: 'com.example.ocebot',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDmFf5Q7ytvBKdDyWraN_IQJ8kEHv608tU',
    appId: '1:191716262966:ios:3755bf17fdb78084a50497',
    messagingSenderId: '191716262966',
    projectId: 'ocebot-8526f',
    storageBucket: 'ocebot-8526f.appspot.com',
    iosClientId: '191716262966-hbjbahtmdqh0b48eon72cog3mjsee0kc.apps.googleusercontent.com',
    iosBundleId: 'com.example.ocebot',
  );
}
