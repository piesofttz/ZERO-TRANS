import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/themes/app_color.dart';
import '../../../app/themes/app_spacing.dart';
import '../../../app/themes/app_text_style.dart';
import '../../../app/widget/app_bar.dart';
import '../../../app/widget/app_card.dart';
import '../controller/setting_controller.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const AppPageHeader(title: 'Settings'),
      body: ListView(
        padding: AppSpacing.screenPadding.copyWith(top: AppSpacing.md, bottom: AppSpacing.xl),
        children: [
          AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                _SettingTile(
                  icon: Icons.info_outline_rounded,
                  label: 'App Version',
                  trailing: Text(SettingController.appVersion, style: AppTextStyles.bodySecondary),
                ),
                const Divider(height: 1),
                _SettingTile(
                  icon: Icons.cloud_off_rounded,
                  label: 'Backend Status',
                  trailing: Text(
                    'Not connected',
                    style: AppTextStyles.bodySecondary.copyWith(color: AppColors.warning),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          AppCard(
            onTap: () => _confirmLogout(context),
            child: Row(
              children: [
                const Icon(Icons.logout_rounded, color: AppColors.error),
                const SizedBox(width: AppSpacing.md),
                Text('Log Out', style: AppTextStyles.body.copyWith(color: AppColors.error)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _confirmLogout(BuildContext context) {
    Get.defaultDialog(
      title: 'Log Out',
      middleText: 'Are you sure you want to log out?',
      textConfirm: 'Log Out',
      textCancel: 'Cancel',
      confirmTextColor: AppColors.white,
      buttonColor: AppColors.error,
      onConfirm: () {
        Get.back();
        controller.logout();
      },
    );
  }
}

class _SettingTile extends StatelessWidget {
  const _SettingTile({required this.icon, required this.label, required this.trailing});

  final IconData icon;
  final String label;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        children: [
          Icon(icon, color: AppColors.textSecondary, size: 20),
          const SizedBox(width: AppSpacing.md),
          Expanded(child: Text(label, style: AppTextStyles.body)),
          trailing,
        ],
      ),
    );
  }
}
