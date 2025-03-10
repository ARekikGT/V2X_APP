import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    await _messaging.requestPermission(alert: true, badge: true, sound: true);

    const AndroidInitializationSettings androidInitSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initSettings = InitializationSettings(
      android: androidInitSettings,
    );
    await _localNotifications.initialize(initSettings);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showNotification(message);
    });

    String? token = await _messaging.getToken();
    print('FCM Token: $token');
  }

  Future<void> _showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'high_importance_channel',
          'High Importance Notifications',
          importance: Importance.max,
          priority: Priority.high,
        );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
    );
    await _localNotifications.show(
      0,
      message.notification?.title ?? "Traffic Alert",
      message.notification?.body ?? "Check the latest traffic update!",
      platformDetails,
    );
  }
}
