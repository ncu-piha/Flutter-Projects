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
    apiKey: 'AIzaSyDsJ3CVzcHhR5URxIffbnRGvdFWe2UlyGc',
    appId: '1:1082599480926:web:0e1130a748d1f25894decf',
    messagingSenderId: '1082599480926',
    projectId: 'chatapp-2ffd7',
    authDomain: 'chatapp-2ffd7.firebaseapp.com',
    storageBucket: 'chatapp-2ffd7.appspot.com',
    measurementId: 'G-CGNGM15ENT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBq7hVZS10BabEC5i5ABSiCpcM4XmdLthk',
    appId: '1:1082599480926:android:903612ec6f67263f94decf',
    messagingSenderId: '1082599480926',
    projectId: 'chatapp-2ffd7',
    storageBucket: 'chatapp-2ffd7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAv21pXeAfqVemXiD7ELAe4LjYX-F0zXHw',
    appId: '1:1082599480926:ios:06d97f97a763962b94decf',
    messagingSenderId: '1082599480926',
    projectId: 'chatapp-2ffd7',
    storageBucket: 'chatapp-2ffd7.appspot.com',
    iosBundleId: 'com.example.minimalChatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAv21pXeAfqVemXiD7ELAe4LjYX-F0zXHw',
    appId: '1:1082599480926:ios:06d97f97a763962b94decf',
    messagingSenderId: '1082599480926',
    projectId: 'chatapp-2ffd7',
    storageBucket: 'chatapp-2ffd7.appspot.com',
    iosBundleId: 'com.example.minimalChatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDsJ3CVzcHhR5URxIffbnRGvdFWe2UlyGc',
    appId: '1:1082599480926:web:97afa6e18f94c23894decf',
    messagingSenderId: '1082599480926',
    projectId: 'chatapp-2ffd7',
    authDomain: 'chatapp-2ffd7.firebaseapp.com',
    storageBucket: 'chatapp-2ffd7.appspot.com',
    measurementId: 'G-1SBVCH6KVF',
  );
}
