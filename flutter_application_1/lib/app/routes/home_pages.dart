import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';

import '../modules/home/views/Scanqr_screen.dart';
import '../modules/home/views/calender_screen.dart';
import '../modules/home/views/feedback_screen.dart';
import '../modules/home/views/history_screen.dart';
import '../modules/home/views/maps_sceen.dart';
import '../modules/home/views/topup_screen.dart';
import '../modules/home/views/notification_screen.dart';  
import '../modules/home/views/profile_screen.dart';  
import '../modules/home/views/pesan_sekarang.dart'; 
import '../modules/home/views/chat_admin_screen.dart'; // Import halaman chatting dengan admin

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Function to show the settings options
  void _showSettingsOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.history),
                title: Text('History'),
                onTap: () {
                  Get.to(() => HistoryScreen());
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.feedback),
                title: Text('Kritik dan Saran'),
                onTap: () {
                  Get.to(() => FeedbackScreen());
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.map),
                title: Text('Maps'),
                onTap: () {
                  Get.to(() => MapsScreen());
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                children: [
                  Text(
                    "Penginapan",
                    
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      _showSettingsOptions(context);
                    },
                    child: Icon(
                      Icons.settings,
                      size: 20,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(width: 10), // Spasi antara setting dan chat icon
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ChatAdminScreen()); // Arahkan ke halaman chatting dengan admin
                    },
                    child: Icon(
                      Icons.chat_bubble_outline, // Ikon chat bubble
                      size: 20,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 20,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Banjarbaru",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Point Nginap Section
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(5, 10),
                      blurRadius: 20,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 20, top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Point Nginap",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "1320",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => TopUpScreen());
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
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.arrow_upward,
                                size: 25,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Pesan Sekarang Section
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 173, 36, 27),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(5, 10),
                      blurRadius: 20,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 5, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tipe Kamar",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => Pesansekarang());
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
                                "Pesan sekarang",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.arrow_forward,
                                size: 20,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 425),

              // Bottom navigation with additional icons
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(5, 10),
                      blurRadius: 20,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.off(()=> HomeView());
                      },
                      child: Icon(
                        Icons.home,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => CalendarScreen());
                      },
                      child: Icon(
                        Icons.calendar_today,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => ScanQRScreen());
                      },
                      child: Icon(
                        Icons.qr_code_scanner,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => NotificationScreen());
                      },
                      child: Icon(
                        Icons.notifications,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => ProfileScreen());
                      },
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
