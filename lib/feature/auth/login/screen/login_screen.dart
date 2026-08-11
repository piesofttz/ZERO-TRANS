import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/themes/app_color.dart';
import '../../../../app/themes/app_radius.dart';
import '../../../../app/themes/app_spacing.dart';
import '../../../../app/themes/app_text_style.dart';
import '../../../../app/widget/app_button.dart';
import '../../../../core/services/notification_service.dart';
import '../controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSpacing.screenPadding,
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppSpacing.xxl),
                const _Logo(),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  "Agent Login",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headline1,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  "Sign in to view routes and buses",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodySecondary,
                ),
                const SizedBox(height: AppSpacing.xxl + AppSpacing.md),
                Container(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: AppRadius.large,
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: controller.usernameController,
                        textInputAction: TextInputAction.next,
                        style: AppTextStyles.body,
                        decoration: _inputDecoration(
                          label: "Username",
                          icon: Icons.person_outline_rounded,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Enter your username";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Obx(
                        () => TextFormField(
                          controller: controller.passwordController,
                          obscureText: controller.isPasswordHidden.value,
                          textInputAction: TextInputAction.done,
                          style: AppTextStyles.body,
                          onFieldSubmitted: (_) => controller.login(),
                          decoration: _inputDecoration(
                            label: "Password",
                            icon: Icons.lock_outline_rounded,
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isPasswordHidden.value
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: AppColors.textSecondary,
                              ),
                              onPressed: controller.togglePassword,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter your password";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      Obx(
                        () => AppButton(
                          label: "Login",
                          isLoading: controller.isLoading.value,
                          onPressed: controller.login,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                Center(
                  child: TextButton(
                    onPressed: () => NotificationService.info(
                      title: "Need access?",
                      message: "Contact your ZeroTrans administrator for an account.",
                    ),
                    child: Text(
                      "Trouble signing in?",
                      style: AppTextStyles.bodySecondary.copyWith(
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String label,
    required IconData icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      labelStyle: AppTextStyles.bodySecondary,
      prefixIcon: Icon(icon, color: AppColors.textSecondary),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: AppColors.surface,
      contentPadding: const EdgeInsets.symmetric(vertical: 18),
      border: OutlineInputBorder(
        borderRadius: AppRadius.medium,
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.medium,
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppRadius.medium,
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppRadius.medium,
        borderSide: const BorderSide(color: AppColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: AppRadius.medium,
        borderSide: const BorderSide(color: AppColors.error, width: 1.5),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 84,
        height: 84,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppColors.primaryGradient,
        ),
        child: const Icon(
          Icons.directions_bus_filled_rounded,
          color: Colors.white,
          size: 38,
        ),
      ),
    );
  }
}
