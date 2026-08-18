import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  // evito di inizializzare più volte
  bool _isInitialized = false;

  Future<void> initNotification() async {
    if (_isInitialized) return;

    const initSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      iOS: initSettingsIOS,
    );

    await notificationsPlugin.initialize(initSettings);
    _isInitialized = true;
  }

  // aspetto della notifica
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      iOS: DarwinNotificationDetails(),
    );
  }

  // schedulo una notifica che si ripete ogni giorno
  Future<void> scheduleNotification({
    int id = 1,
    required String title,
    required String body,
  }) async {
    await notificationsPlugin.periodicallyShow(
      id,
      title,
      body,
      RepeatInterval.daily,
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  // cancello tutte le notifiche attive
  Future<void> cancelNotification() async {
    await notificationsPlugin.cancelAll();
  }
}