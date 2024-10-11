import 'package:flutter/material.dart';

class Pesansekarang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pesan kamar')),
      body: Center(
        child: Text(
          'Silahkan pesanan anda',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
