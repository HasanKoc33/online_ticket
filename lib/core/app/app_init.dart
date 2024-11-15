import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:online_ticked/core/app/app_firebase_options.dart';

/// uygulama ana kurulum ayarları
final class AppInit {
  AppInit._();

  /// uygulama kurulum ayarları
  static Future<void> initApp() async {

    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );


    unawaited(FirebaseMessaging.instance.requestPermission());
    unawaited( FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    ));


  }
}
