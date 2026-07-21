import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../models/models.dart';
import '../widgets/common_widgets.dart';

class RideDetailsScreen extends StatelessWidget {
  final Booking booking;

  const RideDetailsScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              _buildHeader(context),
              _buildMapPlaceholder(),
              _buildRideInfo(),
              _buildDriverInfo(),
              _buildActionButtons(),
              const SizedBox(height: AppDimensions.xxl),
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
            'Ride Details',
            style: TextStyle(
              fontSize: AppDimensions.fontSizeXxl,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.md,
              vertical: AppDimensions.xs,
            ),
            decoration: BoxDecoration(
              color: AppColors.successGreen.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
            ),
            child: const Text(
              'ACTIVE',
              style: TextStyle(
                fontSize: AppDimensions.fontSizeXs,
                fontWeight: FontWeight.w700,
                color: AppColors.successGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapPlaceholder() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.xxl),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: AppColors.lightBlue.withOpacity(0.3),
          borderRadius: BorderRadius.circular(AppDimensions.radiusXxl),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.9),
                  shape: BoxShape.circle,
                  boxShadow: AppShadows.medium,
                ),
                child: const Icon(
                  Icons.map_rounded,
                  color: AppColors.primaryBlue,
                  size: 40,
                ),
              ),
              const SizedBox(height: AppDimensions.md),
              Text(
                'Live Tracking',
                style: TextStyle(
                  color: AppColors.textSecondary.withOpacity(0.7),
                  fontSize: AppDimensions.fontSizeSm,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRideInfo() {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.xxl),
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.lg),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppDimensions.radiusXxl),
          boxShadow: AppShadows.medium,
        ),
        child: Column(
          children: [
            _buildLocationRow(
              icon: Icons.circle,
              iconColor: AppColors.successGreen,
              title: 'Pickup',
              subtitle: booking.pickupLocation,
              isLast: false,
            ),
            _buildLocationRow(
              icon: Icons.location_on_rounded,
              iconColor: AppColors.primaryBlue,
              title: 'Drop-off',
              subtitle: booking.destination,
              isLast: true,
            ),
            const Divider(height: AppDimensions.xl),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoItem(Icons.access_time_rounded, 'Time', booking.estimatedTime),
                _buildInfoItem(Icons.straighten_rounded, 'Distance', booking.distance),
                _buildInfoItem(Icons.payments_outlined, 'Fare', 'Tsh ${booking.estimatedFare.toStringAsFixed(0)}'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationRow({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required bool isLast,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.sm),
      child: Row(
        children: [
          Column(
            children: [
              Icon(icon, color: iconColor, size: 18),
              if (!isLast)
                Container(
                  width: 2,
                  height: 30,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [iconColor, AppColors.primaryBlue],
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: AppDimensions.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: AppDimensions.fontSizeXs,
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: AppDimensions.fontSizeMd,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primaryBlue, size: 24),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: AppDimensions.fontSizeXs,
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: AppDimensions.fontSizeMd,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildDriverInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.xxl),
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.lg),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppDimensions.radiusXxl),
          boxShadow: AppShadows.medium,
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                shape: BoxShape.circle,
                boxShadow: AppShadows.blue,
              ),
              child: const Icon(
                Icons.person_rounded,
                color: AppColors.white,
                size: 28,
              ),
            ),
            const SizedBox(width: AppDimensions.lg),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    booking.driverName,
                    style: const TextStyle(
                      fontSize: AppDimensions.fontSizeLg,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    booking.vehicleType,
                    style: const TextStyle(
                      fontSize: AppDimensions.fontSizeSm,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                _buildDriverAction(Icons.call_rounded, AppColors.successGreen),
                const SizedBox(width: AppDimensions.sm),
                _buildDriverAction(Icons.message_rounded, AppColors.primaryBlue),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDriverAction(IconData icon, Color color) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color, size: 20),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.xxl),
      child: Row(
        children: [
          Expanded(
            child: GradientButton(
              text: 'Share Ride',
              onPressed: () {},
              icon: Icons.share_rounded,
              height: 52,
            ),
          ),
          const SizedBox(width: AppDimensions.md),
          Expanded(
            child: GradientButton(
              text: 'Cancel',
              onPressed: () {},
              isOutlined: true,
              height: 52,
            ),
          ),
        ],
      ),
    );
  }
}
