import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kritik dan Saran')),
      body: Center(
        child: Text(
          'This is the Kritik dan Saran screen.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
