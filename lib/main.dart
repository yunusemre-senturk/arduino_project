// Package imports:
import 'package:android_project/core/di/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:android_project/app/page/app/app.dart';

void main() async {
  await setupDI(Environment.dev);
  await Firebase.initializeApp();
  runApp(const MainApp());
}
