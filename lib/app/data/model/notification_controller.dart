import 'package:android_project/app/page/app/app.dart';
import 'package:android_project/app/page/notification/notification.dart';
import 'package:android_project/core/res/colors.dart';
import 'package:android_project/core/util/logger.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationService {
  static Future<void> initalizeNotification() async {
    await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
              channelKey: "high_importance_channel",
              channelGroupKey: "high_importance_channel",
              channelName: "Basic Notification",
              channelDescription: "Notification channel for basic tests",
              defaultColor: AppColors.chartDeepPink,
              ledColor: AppColors.white,
              importance: NotificationImportance.Max,
              channelShowBadge: true,
              onlyAlertOnce: true,
              playSound: true,
              criticalAlerts: true)
        ],
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: "high_importance_channel_group",
              channelGroupName: "Group 1")
        ],
        debug: true);
    await AwesomeNotifications()
        .isNotificationAllowed()
        .then((isAllowed) async {
      if (!isAllowed) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
      onNotificationCreatedMethod:
          onNotificationCreatedMethod, /* onNotificationDisplayedMethod: onNotificationDisplayedMethod */
    );
  }

  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    Log.i("onNotificationCreatedMethod");
  }

  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    Log.i("onActionReceivedMethod");
    final payload = receivedAction.payload ?? {};
    if (payload["navigate"] == true) {
      MainApp.navigatorKey.currentState?.push(MaterialPageRoute(
        builder: (context) => const NotificationPage(),
      ));
    }
  }

  static Future<void> onDismissActionReceivedMethod(
      ReceivedNotification receivedNotification) async {
    Log.i("onDismissActionReceivedMethod");
  }

  /* static Future<void> onNotificationDisplayedMethod(
      ReceivedAction receivedAction) async {
    Log.i("onNotificationDisplayedMethod");
  } */

  static Future<void> showNotification({
    required final String title,
    required final String body,
    String? summary,
    Map<String, String>? payload,
    ActionType actionType = ActionType.Default,
    NotificationLayout notificationLayout = NotificationLayout.Default,
    NotificationCategory? category,
    String? bigPicture,
    List<NotificationActionButton>? actionButtons,
    bool scheduled = false,
    int? interval,
  }) async {
    assert(!scheduled || (scheduled && interval != null));

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: -1,
        channelKey: "high_importance_channel",
        title: title,
        body: body,
        actionType: actionType,
        notificationLayout: notificationLayout,
        summary: summary,
        payload: payload,
        bigPicture: bigPicture,
      ),
      schedule: scheduled
          ? NotificationInterval(
              timeZone:
                  await AwesomeNotifications().getLocalTimeZoneIdentifier(),
              preciseAlarm: true,
              interval: interval)
          : null,
    );
  }
}
