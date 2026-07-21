import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_strings.dart';
import '../widgets/component_widgets.dart';
import 'settings_screen.dart';
import 'notification_screen.dart';
import 'favorite_locations_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              _buildHeader(),
              _buildProfileCard(),
              _buildMenuItems(context),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.xxl),
      decoration: const BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppDimensions.radiusXxxl),
        ),
      ),
      child: Column(
        children: [
          const Text(
            AppStrings.profile,
            style: TextStyle(
              fontSize: AppDimensions.fontSizeXxl,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: AppDimensions.xl),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.white, width: 4),
              boxShadow: AppShadows.medium,
            ),
            child: const Icon(
              Icons.person_rounded,
              color: AppColors.primaryBlue,
              size: 50,
            ),
          ),
          const SizedBox(height: AppDimensions.md),
          const Text(
            'John Doe',
            style: TextStyle(
              fontSize: AppDimensions.fontSizeXxl,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
          const Text(
            'john.doe@email.com',
            style: TextStyle(
              fontSize: AppDimensions.fontSizeMd,
              color: AppColors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: AppDimensions.lg),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStatItem('4.8', 'Rating'),
              const SizedBox(width: AppDimensions.xxl),
              _buildStatItem('156', 'Rides'),
              const SizedBox(width: AppDimensions.xxl),
              _buildStatItem('2', 'Years'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: AppDimensions.fontSizeXxl,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: AppDimensions.fontSizeSm,
            color: AppColors.white.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileCard() {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.xxl),
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.lg),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppDimensions.radiusXl),
          boxShadow: AppShadows.medium,
        ),
        child: Row(
          children: [
            _buildQuickInfo(Icons.star_rounded, '4.8 Rating', AppColors.warningOrange),
            Container(
              height: 40,
              width: 1,
              color: AppColors.lightBlue,
              margin: const EdgeInsets.symmetric(horizontal: AppDimensions.md),
            ),
            _buildQuickInfo(Icons.directions_car_rounded, '156 Rides', AppColors.primaryBlue),
            Container(
              height: 40,
              width: 1,
              color: AppColors.lightBlue,
              margin: const EdgeInsets.symmetric(horizontal: AppDimensions.md),
            ),
            _buildQuickInfo(Icons.verified_rounded, 'Verified', AppColors.successGreen),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickInfo(IconData icon, String text, Color color) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              fontSize: AppDimensions.fontSizeSm,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.xxl),
      child: Column(
        children: [
          ProfileTile(
            icon: Icons.person_outline_rounded,
            title: AppStrings.personalInfo,
            subtitle: 'Manage your personal details',
            onTap: () {},
          ),
          const SizedBox(height: AppDimensions.md),
          ProfileTile(
            icon: Icons.location_on_outlined,
            title: AppStrings.favoriteLocations,
            subtitle: 'Home, work & saved places',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const FavoriteLocationsScreen()),
            ),
          ),
          const SizedBox(height: AppDimensions.md),
          ProfileTile(
            icon: Icons.payment_rounded,
            title: AppStrings.myCards,
            subtitle: 'Manage payment methods',
            onTap: () {},
          ),
          const SizedBox(height: AppDimensions.md),
          ProfileTile(
            icon: Icons.notifications_none_rounded,
            title: AppStrings.notifications,
            subtitle: 'Notification preferences',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NotificationScreen()),
            ),
          ),
          const SizedBox(height: AppDimensions.md),
          ProfileTile(
            icon: Icons.settings_outlined,
            title: AppStrings.settings,
            subtitle: 'App preferences & privacy',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsScreen()),
            ),
          ),
          const SizedBox(height: AppDimensions.md),
          ProfileTile(
            icon: Icons.help_outline_rounded,
            title: AppStrings.helpSupport,
            subtitle: 'Get help with your rides',
            onTap: () {},
          ),
          const SizedBox(height: AppDimensions.md),
          ProfileTile(
            icon: Icons.info_outline_rounded,
            title: AppStrings.about,
            subtitle: 'App version & legal info',
            onTap: () {},
          ),
          const SizedBox(height: AppDimensions.xl),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: AppDimensions.lg),
              decoration: BoxDecoration(
                color: AppColors.errorRed.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppDimensions.radiusXl),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.logout_rounded,
                    color: AppColors.errorRed,
                    size: 20,
                  ),
                  SizedBox(width: AppDimensions.sm),
                  Text(
                    AppStrings.logout,
                    style: TextStyle(
                      fontSize: AppDimensions.fontSizeMd,
                      fontWeight: FontWeight.w600,
                      color: AppColors.errorRed,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
