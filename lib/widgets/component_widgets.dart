import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import 'common_widgets.dart';

class TransportCard extends StatelessWidget {
  final String name;
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  const TransportCard({
    super.key,
    required this.name,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'taxi':
        return Icons.local_taxi_rounded;
      case 'bike':
        return Icons.two_wheeler_rounded;
      case 'bus':
        return Icons.directions_bus_rounded;
      case 'auto':
        return Icons.pedal_bike_rounded;
      case 'train':
        return Icons.train_rounded;
      case 'car':
        return Icons.directions_car_rounded;
      case 'airport':
        return Icons.flight_rounded;
      default:
        return Icons.directions_car_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 90,
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.lg,
          horizontal: AppDimensions.md,
        ),
        decoration: BoxDecoration(
          gradient: isSelected ? AppColors.primaryGradient : null,
          color: isSelected ? null : AppColors.white,
          borderRadius: BorderRadius.circular(AppDimensions.radiusXl),
          boxShadow: isSelected ? AppShadows.blue : AppShadows.small,
          border: isSelected
              ? null
              : Border.all(
                  color: AppColors.lightBlue.withOpacity(0.3),
                  width: 1,
                ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.white.withOpacity(0.2)
                    : AppColors.lightBlue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
              ),
              child: Icon(
                _getIcon(icon),
                color: isSelected ? AppColors.white : AppColors.primaryBlue,
                size: 24,
              ),
            ),
            const SizedBox(height: AppDimensions.sm),
            Text(
              name,
              style: TextStyle(
                color: isSelected ? AppColors.white : AppColors.textPrimary,
                fontSize: AppDimensions.fontSizeSm,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class DestinationChip extends StatelessWidget {
  final String name;
  final String? icon;
  final bool isSelected;
  final VoidCallback onTap;

  const DestinationChip({
    super.key,
    required this.name,
    this.icon,
    required this.isSelected,
    required this.onTap,
  });

  IconData _getIcon(String? iconName) {
    switch (iconName) {
      case 'airport':
        return Icons.flight_rounded;
      case 'mall':
        return Icons.shopping_bag_rounded;
      case 'university':
        return Icons.school_rounded;
      case 'hospital':
        return Icons.local_hospital_rounded;
      case 'city':
        return Icons.location_city_rounded;
      case 'bus':
        return Icons.directions_bus_rounded;
      default:
        return Icons.location_on_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.lg,
          vertical: AppDimensions.md,
        ),
        decoration: BoxDecoration(
          gradient: isSelected ? AppColors.primaryGradient : null,
          color: isSelected ? null : AppColors.white,
          borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
          boxShadow: isSelected ? AppShadows.blue : AppShadows.small,
          border: isSelected
              ? null
              : Border.all(
                  color: AppColors.lightBlue.withOpacity(0.3),
                  width: 1,
                ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _getIcon(icon),
              color: isSelected ? AppColors.white : AppColors.primaryBlue,
              size: 18,
            ),
            const SizedBox(width: AppDimensions.sm),
            Text(
              name,
              style: TextStyle(
                color: isSelected ? AppColors.white : AppColors.textPrimary,
                fontSize: AppDimensions.fontSizeSm,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RideCard extends StatelessWidget {
  final String driverName;
  final String vehicleType;
  final String pickupTime;
  final String destination;
  final String status;
  final double estimatedFare;
  final String estimatedTime;
  final VoidCallback? onTrack;
  final VoidCallback? onCancel;

  const RideCard({
    super.key,
    required this.driverName,
    required this.vehicleType,
    required this.pickupTime,
    required this.destination,
    required this.status,
    required this.estimatedFare,
    required this.estimatedTime,
    this.onTrack,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.lg),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXxl),
        boxShadow: AppShadows.medium,
        border: Border.all(
          color: AppColors.lightBlue.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
                ),
                child: const Icon(
                  Icons.person_rounded,
                  color: AppColors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: AppDimensions.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      driverName,
                      style: const TextStyle(
                        fontSize: AppDimensions.fontSizeLg,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      vehicleType,
                      style: const TextStyle(
                        fontSize: AppDimensions.fontSizeSm,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.md,
                  vertical: AppDimensions.xs,
                ),
                decoration: BoxDecoration(
                  color: status == 'upcoming'
                      ? AppColors.lightBlue
                      : status == 'completed'
                          ? AppColors.successGreen.withOpacity(0.1)
                          : AppColors.errorRed.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
                ),
                child: Text(
                  status.toUpperCase(),
                  style: TextStyle(
                    fontSize: AppDimensions.fontSizeXs,
                    fontWeight: FontWeight.w600,
                    color: status == 'upcoming'
                        ? AppColors.primaryBlue
                        : status == 'completed'
                            ? AppColors.successGreen
                            : AppColors.errorRed,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.lg),
          Container(
            padding: const EdgeInsets.all(AppDimensions.md),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
            ),
            child: Row(
              children: [
                _buildInfoItem(Icons.access_time_rounded, 'Time', estimatedTime),
                const SizedBox(width: AppDimensions.md),
                Container(
                  height: 30,
                  width: 1,
                  color: AppColors.lightBlue,
                ),
                const SizedBox(width: AppDimensions.md),
                _buildInfoItem(Icons.payments_outlined, 'Fare', 'Tsh ${estimatedFare.toStringAsFixed(0)}'),
                const SizedBox(width: AppDimensions.md),
                Container(
                  height: 30,
                  width: 1,
                  color: AppColors.lightBlue,
                ),
                const SizedBox(width: AppDimensions.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Destination',
                        style: TextStyle(
                          fontSize: 10,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      Text(
                        destination,
                        style: const TextStyle(
                          fontSize: AppDimensions.fontSizeSm,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppDimensions.lg),
          Row(
            children: [
              Expanded(
                child: GradientButton(
                  text: 'Track Ride',
                  onPressed: onTrack ?? () {},
                  height: 44,
                ),
              ),
              const SizedBox(width: AppDimensions.md),
              GradientButton(
                text: 'Cancel',
                onPressed: onCancel ?? () {},
                isOutlined: true,
                height: 44,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, size: 18, color: AppColors.primaryBlue),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: AppDimensions.fontSizeSm,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}

class OfferCard extends StatelessWidget {
  final String title;
  final String description;
  final String discount;
  final bool isNew;
  final VoidCallback onClaim;

  const OfferCard({
    super.key,
    required this.title,
    required this.description,
    required this.discount,
    this.isNew = false,
    required this.onClaim,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(AppDimensions.lg),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXxl),
        boxShadow: AppShadows.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (isNew)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.sm,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.successGreen,
                    borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
                  ),
                  child: const Text(
                    'NEW',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                ),
              const Spacer(),
              Text(
                discount,
                style: const TextStyle(
                  fontSize: AppDimensions.fontSizeXxxl,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.md),
          Text(
            title,
            style: const TextStyle(
              fontSize: AppDimensions.fontSizeLg,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: AppDimensions.xs),
          Text(
            description,
            style: TextStyle(
              fontSize: AppDimensions.fontSizeSm,
              color: AppColors.white.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: AppDimensions.lg),
          GestureDetector(
            onTap: onClaim,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.lg,
                vertical: AppDimensions.sm,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
              ),
              child: const Text(
                'Claim Offer',
                style: TextStyle(
                  fontSize: AppDimensions.fontSizeSm,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryBlue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  final String type;
  final bool isRead;
  final VoidCallback? onTap;

  const NotificationTile({
    super.key,
    required this.title,
    required this.message,
    required this.time,
    required this.type,
    this.isRead = false,
    this.onTap,
  });

  IconData _getTypeIcon(String type) {
    switch (type) {
      case 'ride':
        return Icons.directions_car_rounded;
      case 'offer':
        return Icons.local_offer_rounded;
      case 'payment':
        return Icons.payments_rounded;
      case 'rating':
        return Icons.star_rounded;
      default:
        return Icons.notifications_rounded;
    }
  }

  Color _getTypeColor(String type) {
    switch (type) {
      case 'ride':
        return AppColors.primaryBlue;
      case 'offer':
        return AppColors.successGreen;
      case 'payment':
        return AppColors.accentBlue;
      case 'rating':
        return AppColors.warningOrange;
      default:
        return AppColors.primaryBlue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.lg),
        decoration: BoxDecoration(
          color: isRead ? AppColors.white : AppColors.lightBlue.withOpacity(0.3),
          borderRadius: BorderRadius.circular(AppDimensions.radiusXl),
          border: Border.all(
            color: isRead
                ? AppColors.lightBlue.withOpacity(0.2)
                : AppColors.primaryBlue.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: _getTypeColor(type).withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
              ),
              child: Icon(
                _getTypeIcon(type),
                color: _getTypeColor(type),
                size: 22,
              ),
            ),
            const SizedBox(width: AppDimensions.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: AppDimensions.fontSizeMd,
                      fontWeight: isRead ? FontWeight.w500 : FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.xs),
                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: AppDimensions.fontSizeSm,
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppDimensions.xs),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: AppDimensions.fontSizeXs,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            if (!isRead)
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.primaryBlue,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final Widget? trailing;

  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.lg,
          vertical: AppDimensions.lg,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppDimensions.radiusXl),
          boxShadow: AppShadows.small,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.lightBlue.withOpacity(0.5),
                borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
              ),
              child: Icon(
                icon,
                color: AppColors.primaryBlue,
                size: 22,
              ),
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
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: const TextStyle(
                        fontSize: AppDimensions.fontSizeSm,
                        color: AppColors.textSecondary,
                      ),
                    ),
                ],
              ),
            ),
            trailing ??
                const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.textSecondary,
                  size: 22,
                ),
          ],
        ),
      ),
    );
  }
}
