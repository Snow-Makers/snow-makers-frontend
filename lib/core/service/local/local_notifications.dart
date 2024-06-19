import 'dart:developer';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

mixin LocalNotifications {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static late AndroidInitializationSettings androidInitializationSettings;
  static late DarwinInitializationSettings darwinInitializationSettings;
  static late InitializationSettings initializationSettings;

  static Future<void> initializing() async {
    androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    darwinInitializationSettings = const DarwinInitializationSettings();
    initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {},
      onDidReceiveBackgroundNotificationResponse: onBackground,
    );
  }

  static void onBackground(NotificationResponse notificationResponse) {
    log('notification(${notificationResponse.id}) action tapped: '
        '${notificationResponse.actionId} with'
        ' payload: ${notificationResponse.payload}');
    if (notificationResponse.input?.isNotEmpty ?? false) {
      log(
        'notification action tapped with input: ${notificationResponse.input}',
      );
    }
  }

  static void onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) {
    return log("onDidReceiveLocalNotification");
  }

  static Future<void> sendNotification({
    required String title,
    required String body,
    required String payload,
    String? roomId,
  }) async {
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      _getNotificationsDetails(),
      payload: payload,
    );
  }

  static Future<void> scheduleNotification({
    required String title,
    required String body,
    required DateTime scheduledTime,
  }) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      tz.TZDateTime.from(scheduledTime, tz.local),
      _getNotificationsDetails(),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static NotificationDetails _getNotificationsDetails() {
    const androidNotificationDetails = AndroidNotificationDetails(
      'Channel ID',
      'Channel title',
      priority: Priority.low,
      importance: Importance.max,
      icon: 'mipmap/ic_launcher',
      ticker: 'test',
    );

    const iosNotificationDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );

    return notificationDetails;
  }
}
