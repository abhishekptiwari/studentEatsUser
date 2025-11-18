// GENERATED FILE - DO NOT EDIT
//
// ignore_for_file: type=lint

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your applications.
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
        return linux;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCEfjEvibg7en3v4XZGbywlHgKmum1mXec',
    appId: '1:187971674789:web:5a1f3c072b86aa1a0a34c',
    messagingSenderId: '187971674789',
    projectId: 'studenteats-40095',
    authDomain: 'studenteats.firebaseapp.com',
    storageBucket: 'studenteats-40095.firebasestorage.app',
    measurementId: 'G-0ZFSF0JRMN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCEfjEvibg7en3v4XZGbywlHgKmum1mXec',
    appId: '1:187971674789:android:3dae037c45663140a0a34c',
    messagingSenderId: '187971674789',
    projectId: 'studenteats-40095',
    storageBucket: 'studenteats-40095.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzHWIQp_RVmD4zN5lSCnBy1SPkvfHrIMQ',
    appId: '1:491987943015:ios:a52cf155c77290d78f1ec2',
    messagingSenderId: '491987943015',
    projectId: 'stackmart-500c7',
    storageBucket: 'stackmart-500c7.appspot.com',
    iosClientId:
        '491987943015-8enep3h58pfk6da9oc17rv2iqostjvln.apps.googleusercontent.com',
    iosBundleId: 'com.sixamtech.stackfood',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBzHWIQp_RVmD4zN5lSCnBy1SPkvfHrIMQ',
    appId: '1:491987943015:ios:a52cf155c77290d78f1ec2',
    messagingSenderId: '491987943015',
    projectId: 'stackmart-500c7',
    storageBucket: 'stackmart-500c7.appspot.com',
    iosClientId:
        '491987943015-8enep3h58pfk6da9oc17rv2iqostjvln.apps.googleusercontent.com',
    iosBundleId: 'com.sixamtech.stackfood',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCEfjEvibg7en3v4XZGbywlHgKmum1mXec',
    appId: '1:187971674789:web:5a1f3c072b86aa1a0a34c',
    messagingSenderId: '187971674789',
    projectId: 'studenteats-40095',
    storageBucket: 'studenteats-40095.firebasestorage.app',
  );

  static const FirebaseOptions linux = FirebaseOptions(
    apiKey: 'AIzaSyCEfjEvibg7en3v4XZGbywlHgKmum1mXec',
    appId: '1:187971674789:web:5a1f3c072b86aa1a0a34c',
    messagingSenderId: '187971674789',
    projectId: 'studenteats-40095',
    storageBucket: 'studenteats-40095.firebasestorage.app',
  );
}
