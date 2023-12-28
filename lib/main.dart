// Package imports:
import 'package:android_project/app/data/model/notification_controller.dart';
import 'package:android_project/app/data/service/firebase_api.dart';
import 'package:android_project/core/di/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:android_project/app/page/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotification();
  await setupDI(Environment.dev);
  await NotificationService.initalizeNotification();
  runApp(const MainApp());
}
