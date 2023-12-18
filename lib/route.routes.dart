// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RouteMapConfigGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:route_map/route_map.dart';
import 'package:android_project/core/widget/media_viewer.dart';
import 'package:android_project/core/widget/agreement.dart';
import 'package:android_project/app/page/home/home.dart';
import 'package:android_project/app/page/notification/notification.dart';

class RouteMaps {
  static const String mediaViewerRoute = "/media_viewer_page";
  static const String agreementRoute = "/agreement_page";
  static const String homeRoute = "/home_page";
  static const String notificationRoute = "/notification_page";
}

Map<String, RouteModel> get routes => _routes;
final Map<String, RouteModel> _routes = {
  RouteMaps.mediaViewerRoute: RouteModel(
    (c) => MediaViewerPage(
      c.routeArgsWithKey<List<dynamic>>("imageList")!,
      selectedIndex: c.routeArgsWithKey<int>("selectedIndex") ?? 0,
    ),
    fullscreenDialog: true,
  ),
  RouteMaps.agreementRoute: RouteModel(
    (c) => AgreementPage(
      body: c.routeArgsWithKey<String>("body")!,
      isShowAction: c.routeArgsWithKey<bool>("isShowAction") ?? true,
      title: c.routeArgsWithKey<String>("title")!,
    ),
    fullscreenDialog: true,
  ),
  RouteMaps.homeRoute: RouteModel(
    (_) => const HomePage(),
  ),
  RouteMaps.notificationRoute: RouteModel(
    (_) => const NotificationPage(),
  ),
};
Route? $onGenerateRoute(RouteSettings routeSettings,
        {String? Function(String routeName)? redirect}) =>
    onGenerateRouteWithRoutesSettings(
      routeSettings,
      routes,
      redirect: redirect,
    );

class MediaViewerRoute extends BaseRoute {
  MediaViewerRoute({
    required List<dynamic> imageList,
    int? selectedIndex,
  }) : super(RouteMaps.mediaViewerRoute,
            args: MediaViewerRouteArgs(
              imageList: imageList,
              selectedIndex: selectedIndex ?? 0,
            ).map);
  static const String name = RouteMaps.mediaViewerRoute;
}

class MediaViewerRouteArgs {
  final List<dynamic> imageList;
  final int selectedIndex;
  MediaViewerRouteArgs({
    required this.imageList,
    this.selectedIndex = 0,
  });
  Map<String, dynamic>? get map => {
        "imageList": imageList,
        "selectedIndex": selectedIndex,
      };
}

class AgreementRoute extends BaseRoute {
  AgreementRoute({
    required String body,
    bool? isShowAction,
    required String title,
  }) : super(RouteMaps.agreementRoute,
            args: AgreementRouteArgs(
              body: body,
              isShowAction: isShowAction ?? true,
              title: title,
            ).map);
  static const String name = RouteMaps.agreementRoute;
}

class AgreementRouteArgs {
  final String body;
  final bool isShowAction;
  final String title;
  AgreementRouteArgs({
    required this.body,
    this.isShowAction = true,
    required this.title,
  });
  Map<String, dynamic>? get map => {
        "body": body,
        "isShowAction": isShowAction,
        "title": title,
      };
}

class HomeRoute extends BaseRoute {
  HomeRoute() : super(RouteMaps.homeRoute);
  static const String name = RouteMaps.homeRoute;
}

class NotificationRoute extends BaseRoute {
  NotificationRoute() : super(RouteMaps.notificationRoute);
  static const String name = RouteMaps.notificationRoute;
}
