import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/themes/app_color.dart';
import '../../../app/themes/app_spacing.dart';
import '../../../app/themes/app_text_style.dart';
import '../../../app/widget/app_bar.dart';
import '../../../app/widget/app_card.dart';
import '../controller/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const AppPageHeader(title: 'Profile'),
      body: ListView(
        padding: AppSpacing.screenPadding.copyWith(top: AppSpacing.md, bottom: AppSpacing.xl),
        children: [
          Container(
            width: 88,
            height: 88,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.primaryGradient,
            ),
            child: const Icon(Icons.person_rounded, color: AppColors.white, size: 42),
          ),
          const SizedBox(height: AppSpacing.md),
          Center(child: Text(controller.agentName, style: AppTextStyles.headline2)),
          const SizedBox(height: 4),
          Center(child: Text(controller.agentEmail, style: AppTextStyles.bodySecondary)),
          const SizedBox(height: AppSpacing.xl),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Role', style: AppTextStyles.caption),
                const SizedBox(height: 4),
                const Text('Ticketing Agent', style: AppTextStyles.body),
                const SizedBox(height: AppSpacing.md),
                const Divider(height: 1),
                const SizedBox(height: AppSpacing.md),
                Text('Status', style: AppTextStyles.caption),
                const SizedBox(height: 4),
                Row(
                  children: const [
                    Icon(Icons.circle, size: 8, color: AppColors.success),
                    SizedBox(width: 6),
                    Text('Active', style: AppTextStyles.body),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
