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
    apiKey: 'AIzaSyB8Q8UA8LQM3bFnoUODqAm7FzBWJFYS8ns',
    appId: '1:433503068234:web:f9bb9892c2a9607d8c46b3',
    messagingSenderId: '433503068234',
    projectId: 'appabsensisiswa-dbf30',
    authDomain: 'appabsensisiswa-dbf30.firebaseapp.com',
    storageBucket: 'appabsensisiswa-dbf30.firebasestorage.app',
    measurementId: 'G-LVL9SELGLF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDfLLNmKmhr8EG0efFAHcySdqtJP7yB_wI',
    appId: '1:433503068234:android:0aa8a6db2e540d0e8c46b3',
    messagingSenderId: '433503068234',
    projectId: 'appabsensisiswa-dbf30',
    storageBucket: 'appabsensisiswa-dbf30.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBIGNtA-djdvaGg1bDfgxmzoBlzpOY6dEM',
    appId: '1:433503068234:ios:bd07f81434dd626c8c46b3',
    messagingSenderId: '433503068234',
    projectId: 'appabsensisiswa-dbf30',
    storageBucket: 'appabsensisiswa-dbf30.firebasestorage.app',
    iosBundleId: 'com.example.flutterCrudFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBIGNtA-djdvaGg1bDfgxmzoBlzpOY6dEM',
    appId: '1:433503068234:ios:bd07f81434dd626c8c46b3',
    messagingSenderId: '433503068234',
    projectId: 'appabsensisiswa-dbf30',
    storageBucket: 'appabsensisiswa-dbf30.firebasestorage.app',
    iosBundleId: 'com.example.flutterCrudFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB8Q8UA8LQM3bFnoUODqAm7FzBWJFYS8ns',
    appId: '1:433503068234:web:7e00f9f2730e4c358c46b3',
    messagingSenderId: '433503068234',
    projectId: 'appabsensisiswa-dbf30',
    authDomain: 'appabsensisiswa-dbf30.firebaseapp.com',
    storageBucket: 'appabsensisiswa-dbf30.firebasestorage.app',
    measurementId: 'G-PZB3YJM4QM',
  );

}