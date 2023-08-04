import 'package:flutter/material.dart';
import 'package:local_notification/homepage.dart';
import 'package:local_notification/notification_manager/notification_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationManager().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
