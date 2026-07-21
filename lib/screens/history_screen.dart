import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_strings.dart';
import '../models/models.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            _buildFilterBar(),
            Expanded(
              child: _buildHistoryList(),
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
            AppStrings.history,
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

  Widget _buildFilterBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.xxl),
      child: Row(
        children: [
          _buildFilterChip('All Rides', true),
          const SizedBox(width: AppDimensions.sm),
          _buildFilterChip('Completed', false),
          const SizedBox(width: AppDimensions.sm),
          _buildFilterChip('Cancelled', false),
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
        boxShadow: isSelected ? AppShadows.blue : AppShadows.small,
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

  Widget _buildHistoryList() {
    return ListView.separated(
      padding: const EdgeInsets.all(AppDimensions.xxl),
      physics: const BouncingScrollPhysics(),
      itemCount: Booking.rideHistory.length,
      separatorBuilder: (_, __) => const SizedBox(height: AppDimensions.md),
      itemBuilder: (context, index) {
        final booking = Booking.rideHistory[index];
        return _buildHistoryCard(booking);
      },
    );
  }

  Widget _buildHistoryCard(Booking booking) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.lg),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXl),
        boxShadow: AppShadows.small,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  gradient: booking.status == 'completed'
                      ? AppColors.primaryGradient
                      : LinearGradient(
                          colors: [
                            AppColors.errorRed.withOpacity(0.8),
                            AppColors.errorRed,
                          ],
                        ),
                  borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
                ),
                child: Icon(
                  booking.status == 'completed'
                      ? Icons.check_rounded
                      : Icons.close_rounded,
                  color: AppColors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: AppDimensions.lg),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      booking.destination,
                      style: const TextStyle(
                        fontSize: AppDimensions.fontSizeLg,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      '${booking.pickupTime} • ${booking.distance}',
                      style: const TextStyle(
                        fontSize: AppDimensions.fontSizeSm,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Tsh ${booking.estimatedFare.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: AppDimensions.fontSizeLg,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.md),
          Row(
            children: [
              Expanded(
                child: _buildActionChip(Icons.replay_rounded, 'Rebook'),
              ),
              const SizedBox(width: AppDimensions.sm),
              Expanded(
                child: _buildActionChip(Icons.receipt_long_rounded, 'Receipt'),
              ),
              const SizedBox(width: AppDimensions.sm),
              Expanded(
                child: _buildActionChip(Icons.star_outline_rounded, 'Rate'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.sm),
      decoration: BoxDecoration(
        color: AppColors.lightBlue.withOpacity(0.3),
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.primaryBlue, size: 16),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: AppDimensions.fontSizeSm,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryBlue,
            ),
          ),
        ],
      ),
    );
  }
}
