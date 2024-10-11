import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarouselController extends GetxController {
  // PageController for the carousel
  final PageController pageController = PageController();

  // Rx variable to observe the current page
  var currentPage = 0.obs;

  // Function to change the page
  void changePage(int index) {
    currentPage.value = index;
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
