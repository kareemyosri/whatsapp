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
    apiKey: 'AIzaSyDVIWhXowpJJnsg6VQr_TwoiQAqJEVhcAU',
    appId: '1:432209666586:web:1101cf66089fc5f9b9e7a3',
    messagingSenderId: '432209666586',
    projectId: 'chat-app-39e01',
    authDomain: 'chat-app-39e01.firebaseapp.com',
    storageBucket: 'chat-app-39e01.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAiIJSp8XE1XqXBwJ72EOAwODLaUYTB3fw',
    appId: '1:432209666586:android:5b9d0157801a1c96b9e7a3',
    messagingSenderId: '432209666586',
    projectId: 'chat-app-39e01',
    storageBucket: 'chat-app-39e01.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDjFYic4xx69OKmHzaquMyzWwd6vPjVuP4',
    appId: '1:432209666586:ios:9a2097342682e4bdb9e7a3',
    messagingSenderId: '432209666586',
    projectId: 'chat-app-39e01',
    storageBucket: 'chat-app-39e01.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDjFYic4xx69OKmHzaquMyzWwd6vPjVuP4',
    appId: '1:432209666586:ios:d1aeb2120063078cb9e7a3',
    messagingSenderId: '432209666586',
    projectId: 'chat-app-39e01',
    storageBucket: 'chat-app-39e01.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
