import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/views/detail_kamar_view.dart';
import 'package:get/get.dart';
import '../../../routes/home_pages.dart';


class Pesansekarang extends StatelessWidget {
  final List<Map<String, dynamic>> rooms = [
    {
      "title": "Kamar Reguler Single Bed",
      "image": 'assets/images/OIP.jpeg',
      "status": "Pesan",
      "available": true,
      "price": "175.000",
      "points": "1750"
    },
    {
      "title": "Kamar Reguler Double Bed",
      "image": 'assets/images/OIP.jpeg',
      "status": "Habis",
      "available": false,
    },
    {
      "title": "Kamar AC Single Bed",
      "image": 'assets/images/OIP.jpeg',
      "status": "Pesan",
      "available": true,
      "price": "200.000",
      "points": "2000"
    },
    {
      "title": "Kamar AC Double Bed",
      "image": 'assets/images/OIP.jpeg',
      "status": "Habis",
      "available": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan Sekarang'),
        actions: [
          IconButton(
            icon: Icon(Icons.chat_bubble_outline),
            onPressed: () {
              Get.toNamed('/chat'); // Arahkan ke halaman chat admin
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Get.toNamed('/settings'); // Arahkan ke halaman settings
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Bagian Point Nginap
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Point Nginap",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "1320", 
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/topup'); // Arahkan ke halaman Top Up
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Top Up",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.arrow_upward, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // List Kamar
          Expanded(
            child: ListView.builder(
              itemCount: rooms.length,
              itemBuilder: (context, index) {
                final room = rooms[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.brown[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(room["image"]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              room["title"],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("Tersedia: ${room['available'] ? 'Ya' : 'Tidak'}"),
                            Text("Terisi: ${room['available'] ? 'Tidak' : 'Ya'}"),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: room["available"]
                            ? () {
                                // Arahkan ke halaman detail
                                Get.to(() => DetailKamarScreen(
                                  title: room["title"],
                                  image: room["image"],
                                  price: room["price"],
                                  points: room["points"],
                                ));
                              }
                            : null,
                        child: Text(room["status"]),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: room["available"] ? Colors.brown : Colors.grey,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Tentukan index aktif
        onTap: (index) {
          switch (index) {
            case 0:
              Get.offAll(() => HomePage());
              break;
            case 1:
              Get.toNamed('/calendar');
              break;
            case 2:
              Get.toNamed('/qr');
              break;
            case 3:
              Get.toNamed('/notifications');
              break;
            case 4:
              Get.toNamed('/profile');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'QR Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
