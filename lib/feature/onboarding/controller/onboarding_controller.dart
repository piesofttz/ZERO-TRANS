import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_route.dart';
import '../../../core/services/storage_service.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();

  final RxInt currentPage = 0.obs;

  static const pageCount = 3;

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < pageCount - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _finish();
    }
  }

  void skip() {
    _finish();
  }

  void _finish() {
    StorageService.saveHasSeenOnboarding();
    Get.offAllNamed(Routes.login);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
