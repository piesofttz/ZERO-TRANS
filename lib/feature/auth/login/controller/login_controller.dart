import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/routes/app_route.dart';
import '../../../../core/network/api_error_handler.dart';
import '../../../../core/services/notification_service.dart';
import '../../../../core/services/storage_service.dart';
import '../../model/login_request.dart';
import '../../repository/login_repository.dart';

class LoginController extends GetxController {
  LoginController({required this.repository});

  final LoginRepository repository;
  final isLoading = false.obs;

  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final isPasswordHidden = true.obs;

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePassword() {
    isPasswordHidden.toggle();
  }

  Future<void> login() async {
    if (isLoading.value) return;
    if (!(formKey.currentState?.validate() ?? false)) return;

    try {
      isLoading.value = true;

      final request = LoginRequest(
        username: usernameController.text.trim(),
        password: passwordController.text,
      );

      final response = await repository.login(request);

      await StorageService.saveSession(
        accessToken: response.accessToken,
        agentName: response.agent.name,
        agentEmail: response.agent.email,
      );

      NotificationService.success(title: "Welcome", message: response.message);

      Get.offAllNamed(Routes.main);
    } catch (e) {
      final appError = AppErrorHandler.resolve(e);
      NotificationService.error(title: appError.title, message: appError.message);
    } finally {
      isLoading.value = false;
    }
  }
}
