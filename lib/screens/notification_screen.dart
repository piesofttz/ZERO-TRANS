import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_strings.dart';
import '../models/models.dart' as models;
import '../widgets/component_widgets.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            _buildFilterTabs(),
            Expanded(
              child: _buildNotificationsList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.xxl),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
                boxShadow: AppShadows.small,
              ),
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColors.textPrimary,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: AppDimensions.lg),
          const Text(
            AppStrings.notifications,
            style: TextStyle(
              fontSize: AppDimensions.fontSizeXxl,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: const Text(
              'Mark all read',
              style: TextStyle(
                fontSize: AppDimensions.fontSizeSm,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.xxl),
      child: Row(
        children: [
          _buildFilterChip('All', true),
          const SizedBox(width: AppDimensions.sm),
          _buildFilterChip('Rides', false),
          const SizedBox(width: AppDimensions.sm),
          _buildFilterChip('Offers', false),
          const SizedBox(width: AppDimensions.sm),
          _buildFilterChip('Payments', false),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.lg,
        vertical: AppDimensions.sm,
      ),
      decoration: BoxDecoration(
        gradient: isSelected ? AppColors.primaryGradient : null,
        color: isSelected ? null : AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
        boxShadow: isSelected ? AppShadows.blue : null,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: AppDimensions.fontSizeSm,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          color: isSelected ? AppColors.white : AppColors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildNotificationsList() {
    return ListView.separated(
      padding: const EdgeInsets.all(AppDimensions.xxl),
      physics: const BouncingScrollPhysics(),
      itemCount: models.AppNotification.dummyNotifications.length,
      separatorBuilder: (_, __) => const SizedBox(height: AppDimensions.md),
      itemBuilder: (context, index) {
        final notification = models.AppNotification.dummyNotifications[index];
        return NotificationTile(
          title: notification.title,
          message: notification.message,
          time: notification.time,
          type: notification.type,
          isRead: notification.isRead,
          onTap: () {},
        );
      },
    );
  }
}
