import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_application_1/app/modules/home/views/Scanqr_screen.dart';
import 'package:flutter_application_1/app/modules/home/views/calender_screen.dart';
import 'package:flutter_application_1/app/modules/home/views/notification_screen.dart';
import 'package:flutter_application_1/app/modules/home/views/profile_screen.dart';
import 'package:flutter_application_1/app/routes/home_pages.dart';
import 'package:get/get.dart';

class homeNav extends GetView {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  homeNav({super.key});

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaler: const TextScaler.linear(1.0)),
        child: SizedBox(
          height: 54,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: Colors.brown,
            unselectedItemColor: const Color.fromARGB(255, 219, 217, 217),
            selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Container(
                      width: 20,
                      color: landingPageController.tabIndex.value == 0
                          ? const Color.fromARGB(255, 0, 0, 0)
                          : null,
                    ),
                    const Icon(Icons.home, size: 25.0),
                  ],
                ),
                label: '',
                backgroundColor: Colors.brown,
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Container(
                      width: 20,
                      color: landingPageController.tabIndex.value == 1
                          ? const Color.fromARGB(255, 0, 0, 0)
                          : null,
                    ),
                    const Icon(Icons.calendar_today, size: 25.0),
                  ],
                ),
                label: '',
                backgroundColor: Colors.brown,
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Container(
                      width: 20,
                      color: landingPageController.tabIndex.value == 2
                          ? const Color.fromARGB(255, 0, 0, 0)
                          : const Color.fromARGB(255, 255, 255, 255),
                    ),
                    const Icon(Icons.qr_code_scanner, size: 25.0),
                  ],
                ),
                label: '',
                backgroundColor: Colors.brown,
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Container(
                      width: 20,
                      color: landingPageController.tabIndex.value == 2
                          ? const Color.fromARGB(255, 0, 0, 0)
                          : const Color.fromARGB(255, 255, 255, 255),
                    ),
                    const Icon(Icons.notifications, size: 25.0),
                  ],
                ),
                label: '',
                backgroundColor: Colors.brown,
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Container(
                      width: 20,
                      color: landingPageController.tabIndex.value == 2
                          ? const Color.fromARGB(255, 0, 0, 0)
                          : const Color.fromARGB(255, 255, 255, 255),
                    ),
                    const Icon(Icons.person, size: 25.0),
                  ],
                ),
                label: '',
                backgroundColor: Colors.brown,
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final HomeController landingPageController =
        Get.put(HomeController(), permanent: false);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
      body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: [
              HomePage(),
              CalendarScreen(),
              ScanQRScreen(),
              NotificationScreen(),
              ProfileScreen()
            ],
          )),
    ));
  }
}
