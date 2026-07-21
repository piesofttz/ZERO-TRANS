import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_strings.dart';
import '../models/models.dart';
import '../widgets/common_widgets.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String _selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildSearchBar(),
            _buildFilters(),
            Expanded(
              child: _buildExploreContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.all(AppDimensions.xxl),
      child: Row(
        children: [
          Text(
            AppStrings.explore,
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

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.xxl),
      child: CustomSearchBar(
        hintText: 'Explore places & services...',
        onTap: () {},
      ),
    );
  }

  Widget _buildFilters() {
    final filters = ['All', 'Popular', 'Nearby', 'Top Rated', 'New'];
    return SizedBox(
      height: 50,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.xxl,
          vertical: AppDimensions.sm,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: AppDimensions.sm),
        itemBuilder: (context, index) {
          final isSelected = _selectedFilter == filters[index];
          return GestureDetector(
            onTap: () => setState(() => _selectedFilter = filters[index]),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
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
                filters[index],
                style: TextStyle(
                  color: isSelected ? AppColors.white : AppColors.textPrimary,
                  fontSize: AppDimensions.fontSizeSm,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildExploreContent() {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.xxl),
      physics: const BouncingScrollPhysics(),
      children: [
        _buildSectionTitle('Categories'),
        const SizedBox(height: AppDimensions.md),
        _buildCategoriesGrid(),
        const SizedBox(height: AppDimensions.xxl),
        _buildSectionTitle('Nearby Places'),
        const SizedBox(height: AppDimensions.md),
        ...Location.popularDestinations.map((loc) => Padding(
          padding: const EdgeInsets.only(bottom: AppDimensions.md),
          child: _buildPlaceCard(loc),
        )),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: AppDimensions.fontSizeXl,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      ),
    );
  }

  Widget _buildCategoriesGrid() {
    final categories = [
      {'icon': Icons.local_taxi_rounded, 'label': 'Taxi', 'color': AppColors.primaryBlue},
      {'icon': Icons.two_wheeler_rounded, 'label': 'Bike', 'color': AppColors.accentBlue},
      {'icon': Icons.directions_bus_rounded, 'label': 'Bus', 'color': AppColors.successGreen},
      {'icon': Icons.flight_rounded, 'label': 'Airport', 'color': AppColors.warningOrange},
      {'icon': Icons.train_rounded, 'label': 'Train', 'color': AppColors.secondaryBlue},
      {'icon': Icons.local_shipping_rounded, 'label': 'Cargo', 'color': AppColors.darkBlue},
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: AppDimensions.md,
        crossAxisSpacing: AppDimensions.md,
        childAspectRatio: 1.1,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final cat = categories[index];
        return GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppDimensions.radiusXl),
              boxShadow: AppShadows.small,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: (cat['color'] as Color).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    cat['icon'] as IconData,
                    color: cat['color'] as Color,
                    size: 24,
                  ),
                ),
                const SizedBox(height: AppDimensions.sm),
                Text(
                  cat['label'] as String,
                  style: const TextStyle(
                    fontSize: AppDimensions.fontSizeSm,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPlaceCard(Location place) {
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
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
            ),
            child: const Icon(
              Icons.location_on_rounded,
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
                  place.name,
                  style: const TextStyle(
                    fontSize: AppDimensions.fontSizeLg,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  place.address,
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
          ),
        ],
      ),
    );
  }
}
