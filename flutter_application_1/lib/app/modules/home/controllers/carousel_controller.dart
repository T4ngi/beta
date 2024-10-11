import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homeController extends GetxController {
  // PageController for the carousel

  // Rx variable to observe the current page
  int currentPage = 0;
  late PageController pageController;
  Timer? timer;

  var products = [
    {
      'name': 'Kamar 1',
      'price': 'Rp 50.000',
      'discount': '50%',
      'originalPrice': 'Rp 100.000',
      'location': 'Jakarta',
      'image': 'assets/images/kamar1.png' // Example image
    },
    {
      'name': 'kamar2',
      'price': 'Rp 300.000',
      'discount': '10%',
      'originalPrice': 'Rp 330.000',
      'location': 'Jakarta',
      'image': 'assets/images/kamar1.png' // Example image
    },
    {
      'name': 'kamar3',
      'price': 'Rp 500.000',
      'discount': '10%',
      'originalPrice': 'Rp 400.000',
      'location': 'Jakarta',
      'image': 'assets/images/kamar1.png' // Example image
    }
  ].obs;

  void loadInitialProducts() {
    products.addAll([
      {
        'name': 'kamar1',
        'price': 'Rp 50.000',
        'discount': '50%',
        'originalPrice': 'Rp 100.000',
        'location': 'Jakarta',
        'image': 'assets/images/kamar1.png'
      },
      {
        'name': 'kamar2',
        'price': 'Rp 300.000',
        'discount': '10%',
        'originalPrice': 'Rp 330.000',
        'location': 'Jakarta',
        'image': 'assets/images/kamar1.png'
      }
    ]);
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(
        initialPage: 0, viewportFraction: 0.8); // Create PageController
    loadInitialProducts();
    startAutoScroll();
  }

  void startAutoScroll() {
    timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (currentPage < products.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }
}
