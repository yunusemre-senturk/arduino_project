// Package imports:
import 'package:android_project/core/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:android_project/app/page/app/app.dart';

void main() async {
  await setupDI(Environment.dev);
  runApp(const MainApp());
}
