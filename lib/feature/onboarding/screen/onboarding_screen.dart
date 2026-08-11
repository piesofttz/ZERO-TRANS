import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/themes/app_color.dart';
import '../../../app/themes/app_radius.dart';
import '../../../app/themes/app_spacing.dart';
import '../../../app/themes/app_text_style.dart';
import '../../../app/widget/app_button.dart';
import '../controller/onboarding_controller.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: AppSpacing.screenPadding,
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: controller.skip,
                  child: Text(
                    "Skip",
                    style: AppTextStyles.body.copyWith(color: AppColors.primary),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                children: const [
                  _Page(
                    icon: Icons.map_outlined,
                    title: "Browse Bus Routes",
                    subtitle: "See every route your company operates in one place.",
                  ),
                  _Page(
                    icon: Icons.directions_bus_filled_outlined,
                    title: "Check Buses on a Route",
                    subtitle: "Pick a route and view all buses running on it, with schedules and seats.",
                  ),
                  _Page(
                    icon: Icons.confirmation_number_outlined,
                    title: "View Ticket Details",
                    subtitle: "Open a bus to see its ticket details. Booking will unlock once the backend is ready.",
                  ),
                ],
              ),
            ),
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  OnboardingController.pageCount,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
                    width: controller.currentPage.value == index ? 30 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: controller.currentPage.value == index
                          ? AppColors.primary
                          : AppColors.border,
                      borderRadius: AppRadius.pill,
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: AppSpacing.xl),
            Padding(
              padding: AppSpacing.screenPadding,
              child: Obx(() {
                return AppButton(
                  label: controller.currentPage.value == OnboardingController.pageCount - 1
                      ? "Get Started"
                      : "Continue",
                  onPressed: controller.nextPage,
                );
              }),
            ),
            const SizedBox(height: AppSpacing.xl),
          ],
        ),
      ),
    );
  }
}

class _Page extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _Page({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.screenPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: .08),
              borderRadius: AppRadius.large,
            ),
            child: Icon(icon, size: 70, color: AppColors.primary),
          ),
          const SizedBox(height: AppSpacing.xl),
          Text(title, style: AppTextStyles.headline2, textAlign: TextAlign.center),
          const SizedBox(height: AppSpacing.md),
          Text(subtitle, style: AppTextStyles.bodySecondary, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
