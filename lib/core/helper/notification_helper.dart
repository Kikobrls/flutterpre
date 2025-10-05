import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart';
import 'package:timezone/data/latest.dart';

class NotificationHelper {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> configurateLocalTimeZone() async {
    initializeTimeZones();
    setLocalLocation(getLocation('Asia/Jakarta'));
  }

  static initNotification() async {
    await configurateLocalTimeZone();

    AndroidInitializationSettings androidSetting =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    DarwinInitializationSettings iosSetting = DarwinInitializationSettings(
        requestSoundPermission: true,
        requestBadgePermission: true,
        requestAlertPermission: true);
    InitializationSettings setting =
        InitializationSettings(android: androidSetting, iOS: iosSetting);
    await flutterLocalNotificationsPlugin.initialize(setting);
  }

  static TZDateTime convertTime(
      int year, int month, int day, int hour, int minutes) {
    return TZDateTime(local, year, month, day, hour, minutes);
  }

  static Future<void> scheduleNotification(
      {required int id,
      required String title,
      required String body,
      required int hour,
      required int minutes}) async {
    try {
      final now = DateTime.now();
      await flutterLocalNotificationsPlugin.zonedSchedule(
          id,
          title,
          body,
          convertTime(now.year, now.month, now.day, hour, minutes),
          const NotificationDetails(
              android: AndroidNotificationDetails(
                '1', 
                'dewakoding_presensi',
                channelDescription: 'Prayer time notifications',
                importance: Importance.max, 
                priority: Priority.high,
                playSound: true,
                enableVibration: true,
              ),
              iOS: DarwinNotificationDetails(
                presentAlert: true,
                presentBadge: true,
                presentSound: true,
              )),
          androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          matchDateTimeComponents: DateTimeComponents.time);
    } catch (e) {
      print('Error scheduling notification: $e');
      rethrow;
    }
  }

  static cancelAll() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  static Future<bool> requestPermission() async {
    bool isGranted = false;
    if (Platform.isIOS) {
      isGranted = await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  IOSFlutterLocalNotificationsPlugin>()
              ?.requestPermissions(alert: true, sound: true, badge: true) ??
          false;
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin?
          androidFlutterLocalNotificationsPlugin =
          flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      isGranted = await androidFlutterLocalNotificationsPlugin
              ?.requestNotificationsPermission() ??
          false;
    }

    return isGranted;
  }

  static Future<bool> isPermissionGranted() async {
    bool isGranted = false;
    if (Platform.isIOS) {
      final permission = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.checkPermissions();

      isGranted = permission?.isEnabled ?? false;
    } else if (Platform.isAndroid) {
      isGranted = await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.areNotificationsEnabled() ??
          false;
    }

    return isGranted;
  }
}
