// Package imports:
import 'package:android_project/core/di/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:android_project/app/page/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.subscribeToTopic('testMessage');
  await setupDI(Environment.dev);
  runApp(const MainApp());
}
