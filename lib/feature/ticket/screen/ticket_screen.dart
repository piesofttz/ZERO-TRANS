import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/themes/app_color.dart';
import '../../../app/themes/app_radius.dart';
import '../../../app/themes/app_shadow.dart';
import '../../../app/themes/app_spacing.dart';
import '../../../app/themes/app_text_style.dart';
import '../../../app/widget/app_bar.dart';
import '../../../app/widget/app_button.dart';
import '../controller/ticket_controller.dart';

class TicketScreen extends GetView<TicketController> {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final route = controller.route;
    final bus = controller.bus;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const AppPageHeader(title: 'Ticket', showBackButton: true),
      body: SingleChildScrollView(
        padding: AppSpacing.screenPadding.copyWith(top: AppSpacing.md, bottom: AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: AppRadius.large,
                boxShadow: AppShadows.card,
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          route.title,
                          style: AppTextStyles.headline2.copyWith(color: AppColors.white),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${bus.operatorName} • ${bus.busType}',
                          style: AppTextStyles.bodySecondary.copyWith(
                            color: AppColors.white.withValues(alpha: .85),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: _TicketField(label: 'Departure', value: bus.departureTime),
                            ),
                            Expanded(
                              child: _TicketField(label: 'Arrival', value: bus.arrivalTime),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.md),
                        Row(
                          children: [
                            Expanded(
                              child: _TicketField(label: 'Plate Number', value: bus.plateNumber),
                            ),
                            Expanded(
                              child: _TicketField(
                                label: 'Seats Available',
                                value: '${bus.availableSeats} / ${bus.totalSeats}',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.md),
                        _DashedDivider(),
                        const SizedBox(height: AppSpacing.md),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Fare', style: AppTextStyles.body),
                            Text(
                              'GHS ${bus.fare.toStringAsFixed(0)}',
                              style: AppTextStyles.headline2.copyWith(color: AppColors.primary),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.warning.withValues(alpha: .1),
                borderRadius: AppRadius.medium,
                border: Border.all(color: AppColors.warning.withValues(alpha: .3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline_rounded, color: AppColors.warning),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      'Booking is not connected to the backend yet. This is a preview of the ticket only.',
                      style: AppTextStyles.caption.copyWith(color: AppColors.textPrimary),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppButton(
              label: 'Book Ticket',
              icon: Icons.confirmation_number_outlined,
              onPressed: controller.bookTicket,
            ),
          ],
        ),
      ),
    );
  }
}

class _TicketField extends StatelessWidget {
  const _TicketField({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.caption),
        const SizedBox(height: 2),
        Text(value, style: AppTextStyles.title),
      ],
    );
  }
}

class _DashedDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final dashCount = (constraints.maxWidth / 8).floor();
          return Row(
            children: List.generate(dashCount, (_) {
              return Expanded(
                child: Container(
                  height: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  color: AppColors.border,
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
