import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/themes/app_color.dart';
import '../../../app/themes/app_radius.dart';
import '../../../app/themes/app_spacing.dart';
import '../../../app/themes/app_text_style.dart';
import '../../../app/widget/app_bar.dart';
import '../../../app/widget/app_card.dart';
import '../../../app/widget/app_loader.dart';
import '../controller/bus_controller.dart';
import '../model/bus_model.dart';

class BusScreen extends GetView<BusController> {
  const BusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppPageHeader(
        title: controller.route.title,
        subtitle: 'Buses on this route',
        showBackButton: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const AppLoader();
        }

        if (controller.buses.isEmpty) {
          return Center(
            child: Text('No buses on this route', style: AppTextStyles.bodySecondary),
          );
        }

        return RefreshIndicator(
          onRefresh: controller.loadBuses,
          child: ListView.separated(
            padding: AppSpacing.screenPadding.copyWith(top: AppSpacing.md, bottom: AppSpacing.xl),
            itemCount: controller.buses.length,
            separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
            itemBuilder: (context, index) {
              final bus = controller.buses[index];
              return _BusCard(bus: bus, onTap: () => controller.openTicket(bus));
            },
          ),
        );
      }),
    );
  }
}

class _BusCard extends StatelessWidget {
  const _BusCard({required this.bus, required this.onTap});

  final Bus bus;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isAvailable = bus.availableSeats > 0;

    return AppCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: .1),
                  borderRadius: AppRadius.medium,
                ),
                child: const Icon(Icons.directions_bus_filled_rounded, color: AppColors.primary),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(bus.operatorName, style: AppTextStyles.title),
                    const SizedBox(height: 2),
                    Text('${bus.busType} • ${bus.plateNumber}', style: AppTextStyles.caption),
                  ],
                ),
              ),
              Text(
                'GHS ${bus.fare.toStringAsFixed(0)}',
                style: AppTextStyles.title.copyWith(color: AppColors.primary),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          const Divider(height: 1),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              _InfoChip(icon: Icons.schedule_rounded, label: '${bus.departureTime} → ${bus.arrivalTime}'),
              const SizedBox(width: AppSpacing.sm),
              _InfoChip(
                icon: Icons.event_seat_rounded,
                label: isAvailable ? '${bus.availableSeats}/${bus.totalSeats} seats' : 'Full',
                color: isAvailable ? AppColors.success : AppColors.error,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.label, this.color});

  final IconData icon;
  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final chipColor = color ?? AppColors.textSecondary;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: chipColor),
        const SizedBox(width: 4),
        Text(label, style: AppTextStyles.caption.copyWith(color: chipColor)),
      ],
    );
  }
}
