import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/login/login.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  /// Variable
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Cập nhật index hiện tại khi cuộn trang
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Chuyển đến dấu tượng trưng cho trang
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// Cập nhập index hiện tại và chuyển trang tiếp theo
  void nextPage() {
    if (currentPageIndex.value == 1) {
      Get.offAll(() => LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// Cập nhật index hiện tại và chuyển trang cuối
  void skipPage() {
    currentPageIndex.value = 1;
    pageController.jumpToPage(1);
  }
}
