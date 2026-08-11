import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/themes/app_color.dart';

class NotificationService {
  NotificationService._();

  static void success({required String title, required String message}) {
    _show(title: title, message: message, color: AppColors.success, icon: Icons.check_circle_rounded);
  }

  static void error({required String title, required String message}) {
    _show(title: title, message: message, color: AppColors.error, icon: Icons.error_rounded);
  }

  static void info({required String title, required String message}) {
    _show(title: title, message: message, color: AppColors.primary, icon: Icons.info_rounded);
  }

  static void _show({
    required String title,
    required String message,
    required Color color,
    required IconData icon,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: color,
      colorText: AppColors.white,
      icon: Icon(icon, color: AppColors.white),
      margin: const EdgeInsets.all(12),
      borderRadius: 12,
      duration: const Duration(seconds: 3),
    );
  }
}
