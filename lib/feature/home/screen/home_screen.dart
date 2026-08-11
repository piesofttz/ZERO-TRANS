import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/themes/app_color.dart';
import '../../../app/themes/app_radius.dart';
import '../../../app/themes/app_spacing.dart';
import '../../../app/themes/app_text_style.dart';
import '../../../app/widget/app_bar.dart';
import '../../../app/widget/app_card.dart';
import '../../../app/widget/app_loader.dart';
import '../../../app/widget/app_search_bar.dart';
import '../controller/home_controller.dart';
import '../model/route_model.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const AppPageHeader(
        title: 'Routes',
        subtitle: 'Select a route to view its buses',
      ),
      body: RefreshIndicator(
        onRefresh: controller.loadRoutes,
        child: Padding(
          padding: AppSpacing.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppSearchBar(
                hintText: 'Search by origin or destination',
                onChanged: controller.onSearchChanged,
              ),
              const SizedBox(height: AppSpacing.md),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const AppLoader();
                  }

                  final routes = controller.filteredRoutes;

                  if (routes.isEmpty) {
                    return Center(
                      child: Text(
                        'No routes found',
                        style: AppTextStyles.bodySecondary,
                      ),
                    );
                  }

                  return ListView.separated(
                    itemCount: routes.length,
                    separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
                    itemBuilder: (context, index) {
                      return _RouteCard(
                        route: routes[index],
                        onTap: () => controller.openRoute(routes[index]),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RouteCard extends StatelessWidget {
  const _RouteCard({required this.route, required this.onTap});

  final BusRoute route;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: .1),
              borderRadius: AppRadius.medium,
            ),
            child: const Icon(Icons.route_rounded, color: AppColors.primary),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(route.title, style: AppTextStyles.title),
                const SizedBox(height: 4),
                Text(
                  '${route.distance} • ${route.duration} • ${route.busCount} buses',
                  style: AppTextStyles.caption,
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: AppColors.textSecondary),
        ],
      ),
    );
  }
}
