import 'package:flutter/material.dart';

class MapsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps", style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFFA52A2A),
      ),
      body: Center(
        child: Text("This is the Maps Page"),
      ),
    );
  }
}
