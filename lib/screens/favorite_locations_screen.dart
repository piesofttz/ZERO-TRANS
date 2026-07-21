import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_strings.dart';

class FavoriteLocationsScreen extends StatelessWidget {
  const FavoriteLocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(AppDimensions.xxl),
                children: [
                  _buildFavoriteCard(
                    icon: Icons.home_rounded,
                    label: AppStrings.homeAddress,
                    address: '123 Main Street, Apt 4B',
                    color: AppColors.primaryBlue,
                  ),
                  const SizedBox(height: AppDimensions.md),
                  _buildFavoriteCard(
                    icon: Icons.work_rounded,
                    label: AppStrings.workAddress,
                    address: '456 Business Ave, Floor 12',
                    color: AppColors.warningOrange,
                  ),
                  const SizedBox(height: AppDimensions.xxl),
                  const Text(
                    'Other Favorites',
                    style: TextStyle(
                      fontSize: AppDimensions.fontSizeXl,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.md),
                  _buildFavoriteCard(
                    icon: Icons.location_on_rounded,
                    label: 'Gym',
                    address: '789 Fitness Blvd',
                    color: AppColors.successGreen,
                  ),
                  const SizedBox(height: AppDimensions.md),
                  _buildFavoriteCard(
                    icon: Icons.restaurant_rounded,
                    label: 'Favorite Restaurant',
                    address: '321 Food Street',
                    color: AppColors.accentBlue,
                  ),
                  const SizedBox(height: AppDimensions.xxl),
                  _buildAddFavoriteButton(context),
                ],
              ),
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
            AppStrings.favoriteLocations,
            style: TextStyle(
              fontSize: AppDimensions.fontSizeXxl,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteCard({
    required IconData icon,
    required String label,
    required String address,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.lg),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXl),
        boxShadow: AppShadows.small,
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: AppDimensions.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: AppDimensions.fontSizeLg,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  address,
                  style: const TextStyle(
                    fontSize: AppDimensions.fontSizeSm,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuButton(
            icon: const Icon(
              Icons.more_vert_rounded,
              color: AppColors.textSecondary,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
            ),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'edit',
                child: Row(
                  children: [
                    Icon(Icons.edit_rounded, size: 18, color: AppColors.primaryBlue),
                    SizedBox(width: AppDimensions.sm),
                    Text('Edit'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'delete',
                child: Row(
                  children: [
                    Icon(Icons.delete_rounded, size: 18, color: AppColors.errorRed),
                    SizedBox(width: AppDimensions.sm),
                    Text('Delete', style: TextStyle(color: AppColors.errorRed)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddFavoriteButton(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: AppDimensions.lg),
        decoration: BoxDecoration(
          color: AppColors.lightBlue.withOpacity(0.3),
          borderRadius: BorderRadius.circular(AppDimensions.radiusXl),
          border: Border.all(
            color: AppColors.primaryBlue.withOpacity(0.3),
            width: 2,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_rounded,
              color: AppColors.primaryBlue,
              size: 22,
            ),
            SizedBox(width: AppDimensions.sm),
            Text(
              AppStrings.addFavorite,
              style: TextStyle(
                fontSize: AppDimensions.fontSizeMd,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
