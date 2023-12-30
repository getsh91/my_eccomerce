import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:t_store/features/authentication/screens/login/login_page.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentIndex = 0.obs;

  void updatePageIndicator(index) => currentIndex.value = index;

  void dotNavigationClick(index) {
    currentIndex.value = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    pageController.jumpToPage(index);
  }

  void nextPage() {
    if (currentIndex.value == 2) {
      Get.to(const LoginPage());
    } else {
      int pageNumber = currentIndex.value + 1;
      pageController.animateToPage(pageNumber,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      pageController.jumpToPage(pageNumber);
    }
  }

  void skipPage() {
    currentIndex.value = 2;
    pageController.animateToPage(2,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    pageController.jumpToPage(2);
  }
}
