import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_strings.dart';
import '../providers/providers.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              _buildSection('Account', [
                _buildSettingsTile(Icons.person_outline_rounded, 'Personal Info', 'Name, phone, email'),
                _buildSettingsTile(Icons.lock_outline_rounded, 'Security', 'Password, 2FA'),
                _buildSettingsTile(Icons.location_on_outlined, 'Addresses', 'Manage saved addresses'),
              ]),
              _buildSection('Preferences', [
                _buildSwitchTile(
                  Icons.dark_mode_outlined,
                  'Dark Mode',
                  'Use dark theme',
                  themeProvider.isDarkMode,
                  () => themeProvider.toggleTheme(),
                ),
                _buildSettingsTile(Icons.language_rounded, 'Language', 'English (US)'),
                _buildSettingsTile(Icons.notifications_none_rounded, 'Notifications', 'Push, email, SMS'),
                _buildSettingsTile(Icons.map_outlined, 'Map View', 'Satellite'),
              ]),
              _buildSection('Payment', [
                _buildSettingsTile(Icons.payment_rounded, 'Payment Methods', 'Visa ending 4242'),
                _buildSettingsTile(Icons.receipt_long_rounded, 'Transaction History', 'View all transactions'),
                _buildSettingsTile(Icons.card_giftcard_rounded, 'Promo Codes', 'Apply discount codes'),
              ]),
              _buildSection('Support', [
                _buildSettingsTile(Icons.help_outline_rounded, 'Help Center', 'FAQ & guides'),
                _buildSettingsTile(Icons.chat_outlined, 'Chat Support', '24/7 available'),
                _buildSettingsTile(Icons.star_outline_rounded, 'Rate App', 'Share your experience'),
                _buildSettingsTile(Icons.info_outline_rounded, 'About', 'v2.5.0'),
              ]),
              const SizedBox(height: AppDimensions.xxl),
              _buildDeleteAccountButton(),
              const SizedBox(height: 100),
            ],
          ),
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
            AppStrings.settings,
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

  Widget _buildSection(String title, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.xxl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: AppDimensions.fontSizeLg,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppDimensions.md),
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppDimensions.radiusXl),
              boxShadow: AppShadows.small,
            ),
            child: Column(
              children: children,
            ),
          ),
          const SizedBox(height: AppDimensions.xl),
        ],
      ),
    );
  }

  Widget _buildSettingsTile(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.lg,
        vertical: AppDimensions.lg,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.lightBlue.withOpacity(0.5),
              borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
            ),
            child: Icon(icon, color: AppColors.primaryBlue, size: 20),
          ),
          const SizedBox(width: AppDimensions.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: AppDimensions.fontSizeMd,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: AppDimensions.fontSizeSm,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            color: AppColors.textSecondary,
            size: 22,
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchTile(
    IconData icon,
    String title,
    String subtitle,
    bool value,
    VoidCallback onChanged,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.lg,
        vertical: AppDimensions.md,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.lightBlue.withOpacity(0.5),
              borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
            ),
            child: Icon(icon, color: AppColors.primaryBlue, size: 20),
          ),
          const SizedBox(width: AppDimensions.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: AppDimensions.fontSizeMd,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: AppDimensions.fontSizeSm,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Switch.adaptive(
            value: value,
            onChanged: (_) => onChanged(),
            activeColor: AppColors.primaryBlue,
          ),
        ],
      ),
    );
  }

  Widget _buildDeleteAccountButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.xxl),
      child: GestureDetector(
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
                Icons.delete_outline_rounded,
                color: AppColors.errorRed,
                size: 20,
              ),
              SizedBox(width: AppDimensions.sm),
              Text(
                'Delete Account',
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
    );
  }
}
