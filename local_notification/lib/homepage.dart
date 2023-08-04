import 'package:flutter/material.dart';
import 'package:local_notification/notification_manager/notification_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Notification'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                NotificationManager().simpleNotificationShow();
              },
              child: Container(
                height: 50,
                width: 300,
                alignment: Alignment.center,
                color: Colors.black,
                child: Text(
                  'Simple Notification',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                NotificationManager().bigPictureNotificationShow();
              },
              child: Container(
                height: 50,
                width: 300,
                alignment: Alignment.center,
                color: Colors.black,
                child: Text(
                  'Big Picture Notification',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                NotificationManager().multipleNotificationShow();
              },
              child: Container(
                height: 50,
                width: 300,
                alignment: Alignment.center,
                color: Colors.black,
                child: Text(
                  'Mutiple Notification',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
