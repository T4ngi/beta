import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final List<String> notifications = [
    "Your booking is confirmed!",
    "You received a new message.",
    "Room service is on the way.",
    "Check-out time is at 12 PM."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.notifications),
            title: Text(notifications[index]),
          );
        },
      ),
    );
  }
}
