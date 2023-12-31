import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationManager {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('flutter_logo');

    DarwinInitializationSettings initializationSettingsIos =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) {},
    );

    InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIos);
    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {},
    );
  }

  Future<void> simpleNotificationShow() async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails('Channel_id', 'Channel_title',
            priority: Priority.high,
            importance: Importance.max,
            icon: 'flutter_logo',
            channelShowBadge: true,
            largeIcon: DrawableResourceAndroidBitmap('flutter_logo'));

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await notificationsPlugin.show(
        0, 'Simple Notification', 'New User Send Message', notificationDetails);
  }

  Future<void> bigPictureNotificationShow() async {
    BigPictureStyleInformation bigPictureStyleInformation =
        const BigPictureStyleInformation(
            DrawableResourceAndroidBitmap('flutter_logo'),
            contentTitle: 'Code Compilee',
            largeIcon: DrawableResourceAndroidBitmap('flutter_logo'));

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('big_picture_id', 'big_picture_title',
            priority: Priority.high,
            importance: Importance.max,
            styleInformation: bigPictureStyleInformation);

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await notificationsPlugin.show(1, 'Big Picture Notification',
        'New User Send Message', notificationDetails);
  }

  Future<void> multipleNotificationShow() async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails('Channel_id', 'Channel_title',
            priority: Priority.high,
            importance: Importance.max,
            groupKey: 'commonMessage');

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    notificationsPlugin.show(
        0, 'New Notification', 'User 1  Send Message', notificationDetails);

    Future.delayed(const Duration(milliseconds: 1000), () {
      notificationsPlugin.show(
          1, 'New Notification', 'User 2 Send Message', notificationDetails);
    });

    Future.delayed(const Duration(milliseconds: 1500), () {
      notificationsPlugin.show(
          2, 'New Notification', 'User 3 Send Message', notificationDetails);
    });

    List<String> lines = ['user1', 'user2', 'user3'];

    InboxStyleInformation inboxStyleInformation = InboxStyleInformation(lines,
        contentTitle: '${lines.length} messages', summaryText: 'Code Compilee');

    AndroidNotificationDetails androidNotificationSpesific =
        AndroidNotificationDetails('groupChannelId', 'groupChannelTitle',
            styleInformation: inboxStyleInformation,
            groupKey: 'commonMessage',
            setAsGroupSummary: true);
    NotificationDetails platformChannelSpe =
        NotificationDetails(android: androidNotificationSpesific);
    await notificationsPlugin.show(
        3, 'Attention', '${lines.length} messages', platformChannelSpe);
  }
}
