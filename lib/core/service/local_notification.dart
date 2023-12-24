




import 'dart:math';

import '../export/export.dart';


abstract interface class LocalNotification {
  AndroidInitializationSettings get getAndroidInitializationSettings;
  DarwinInitializationSettings get getIosInitializationSettings;
  InitializationSettings get getInitializationSettings;

  AndroidNotificationDetails get getAndroidNotificationDetails;

  DarwinNotificationDetails get getIosNotificationDetails;
  Future<void> initializeLocalNotificationSetting();
  Future<void> cancelAllNotification();
  Future<void> cancelNotification(int id);
  NotificationDetails get getNotificationDetails;
  Future<void> showNotification(NotificationItem notificationItem);
  Future<void> onDidReceiveLocalNotification(
      Function function, int id, String title, String body, String payload);
}

final class LocalNotificationImpl implements LocalNotification {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  LocalNotificationImpl() {
    initializeLocalNotificationSetting();
  }
  @override
  Future<void> initializeLocalNotificationSetting() async {
    await _flutterLocalNotificationsPlugin.initialize(
      getInitializationSettings,
    );
  }

  @override
  NotificationDetails get getNotificationDetails => NotificationDetails(
      android: getAndroidNotificationDetails, iOS: getIosNotificationDetails);
  @override
  Future<void> showNotification(NotificationItem notificationItem) async {
    await _flutterLocalNotificationsPlugin.show(
        Random().nextInt(AppValue.appValue100),
        notificationItem.title,
        notificationItem.content,
        getNotificationDetails);
  }

  Future<void> _onDidReceiveLocalNotification(
      int? id, String? title, String? body, String? payload) async {
   await onDidReceiveLocalNotification(() {}, id!, title!, body!, payload!);
  }

  @override
  Future<void> cancelAllNotification() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }

  @override
  Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  @override
  AndroidInitializationSettings get getAndroidInitializationSettings =>
      const AndroidInitializationSettings(
          AppConstants.appLocalNotificationAndroidIcon);
  @override
  DarwinInitializationSettings get getIosInitializationSettings =>
      DarwinInitializationSettings(
          requestAlertPermission:
              AppConstants.appLocalNotificationIosRequestAlertPermission,
          requestBadgePermission:
              AppConstants.appLocalNotificationIosRequestBadgePermission,
          requestSoundPermission:
              AppConstants.appLocalNotificationIosRequestSoundPermission,
          onDidReceiveLocalNotification: _onDidReceiveLocalNotification);
  @override
  InitializationSettings get getInitializationSettings =>
      InitializationSettings(
          android: getAndroidInitializationSettings,
          iOS: getIosInitializationSettings);
  @override
  AndroidNotificationDetails get getAndroidNotificationDetails =>
      const AndroidNotificationDetails(
        AppConstants.appLocalNotificationAndroidChannelId,
        AppConstants.appLocalNotificationAndroidChannelName,
        channelDescription:
            AppConstants.appLocalNotificationAndroidChannelDescription,
        enableVibration:
            AppConstants.appLocalNotificationIosRequestVibrationPermission,
      playSound: AppConstants.appLocalNotificationIosRequestSoundPermission,
     //   icon: AppConstants.appLocalNotificationAndroidIcon,
        ticker: AppConstants.appLocalNotificationAndroidTicker,
        priority: Priority.max,
        importance: Importance.max,
      );
  @override
  DarwinNotificationDetails get getIosNotificationDetails =>
      const DarwinNotificationDetails(
        presentSound:
            AppConstants.appLocalNotificationIosRequestSoundPermission,
        presentAlert:
            AppConstants.appLocalNotificationIosRequestAlertPermission,
        presentBadge:
            AppConstants.appLocalNotificationIosRequestBadgePermission,
      );
  @override
  Future<void> onDidReceiveLocalNotification(Function function, int id,
      String title, String body, String payload) async {
    await function.call();
  }
}
