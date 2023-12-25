import 'package:android_project/app/data/model/notification_controller.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:android_project/app/page/app/app_vm.dart';
import 'package:android_project/core/base/base_widget.dart';
import 'package:android_project/core/res/theme.dart';
import 'package:android_project/route.dart';
import 'package:android_project/route.routes.dart';

class MainApp extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends BaseState<AppViewModel, MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: MainApp.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: "Tempeture",
      theme: AppTheme.theme(isDark: viewModel.isDark),
      initialRoute: RouteMaps.homeRoute,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
