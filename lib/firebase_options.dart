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
    apiKey: 'AIzaSyCLUeyoJqoK2nV0BQlHWm4i7HqJPjmBAg8',
    appId: '1:977475856968:web:bfe7b28b6c17fcc414067d',
    messagingSenderId: '977475856968',
    projectId: 'status-database-c30b5',
    authDomain: 'status-database-c30b5.firebaseapp.com',
    databaseURL: 'https://status-database-c30b5-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'status-database-c30b5.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBqUkqoVBD4mU0RuQOhxWK5HrgxCd3aB_w',
    appId: '1:977475856968:android:0fcdcb242711117f14067d',
    messagingSenderId: '977475856968',
    projectId: 'status-database-c30b5',
    databaseURL: 'https://status-database-c30b5-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'status-database-c30b5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyArx4Ly7q6Xt-ERlqumF9-tmkk3vU0A_NQ',
    appId: '1:977475856968:ios:c84ebe475662b59014067d',
    messagingSenderId: '977475856968',
    projectId: 'status-database-c30b5',
    databaseURL: 'https://status-database-c30b5-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'status-database-c30b5.appspot.com',
    iosClientId: '977475856968-o8pggevvqbk1no02b0e6vm16h0sff2ei.apps.googleusercontent.com',
    iosBundleId: 'com.example.status',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyArx4Ly7q6Xt-ERlqumF9-tmkk3vU0A_NQ',
    appId: '1:977475856968:ios:c84ebe475662b59014067d',
    messagingSenderId: '977475856968',
    projectId: 'status-database-c30b5',
    databaseURL: 'https://status-database-c30b5-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'status-database-c30b5.appspot.com',
    iosClientId: '977475856968-o8pggevvqbk1no02b0e6vm16h0sff2ei.apps.googleusercontent.com',
    iosBundleId: 'com.example.status',
  );
}