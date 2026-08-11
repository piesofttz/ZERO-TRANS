import 'dart:async';

import 'package:get/get.dart';

import '../../../app/routes/app_route.dart';
import '../../../core/services/storage_service.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 2), _navigate);
  }

  void _navigate() {
    if (!StorageService.getHasSeenOnboarding()) {
      Get.offAllNamed(Routes.onboarding);
      return;
    }

    final token = StorageService.getAccessToken();

    if (token != null && token.isNotEmpty) {
      Get.offAllNamed(Routes.main);
    } else {
      Get.offAllNamed(Routes.login);
    }
  }
}
