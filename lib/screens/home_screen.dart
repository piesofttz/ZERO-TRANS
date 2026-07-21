import 'dart:async';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_strings.dart';
import '../models/models.dart';
import '../widgets/common_widgets.dart';
import '../widgets/component_widgets.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  final PageController _bannerController = PageController();
  int _currentBanner = 0;
  Timer? _bannerTimer;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );
    _animController.forward();
    _startBannerTimer();
  }

  void _startBannerTimer() {
    _bannerTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_bannerController.hasClients) {
        final nextPage = (_currentBanner + 1) % 3;
        _bannerController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    _bannerController.dispose();
    _bannerTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          _buildBackground(),
          SafeArea(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(child: _buildHeader()),
                    SliverToBoxAdapter(child: _buildSearchBar(context)),
                    SliverToBoxAdapter(child: _buildAdBanner()),
                    SliverToBoxAdapter(child: _buildTransportCategories(context)),
                    SliverToBoxAdapter(child: _buildPopularBus(context)),
                    SliverToBoxAdapter(child: _buildSpecialOffers(context)),
                    const SliverToBoxAdapter(child: SizedBox(height: 20)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFEFF6FF),
            AppColors.background,
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppDimensions.xxl,
        AppDimensions.lg,
        AppDimensions.xxl,
        0,
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              shape: BoxShape.circle,
              boxShadow: AppShadows.blue,
              border: Border.all(color: AppColors.white, width: 2),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/logo/logo.jpeg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.directions_bus_rounded,
                    color: AppColors.white,
                    size: 26,
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: AppDimensions.md),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good afternoon 👋',
                  style: TextStyle(
                    fontSize: AppDimensions.fontSizeSm,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'PieSoft Company',
                  style: TextStyle(
                    fontSize: AppDimensions.fontSizeXl,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          _buildHeaderIcon(Icons.notifications_none_rounded, hasNotification: true),
          const SizedBox(width: AppDimensions.sm),
          _buildHeaderIcon(Icons.account_balance_wallet_rounded),
        ],
      ),
    );
  }

  Widget _buildHeaderIcon(IconData icon, {bool hasNotification = false}) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        boxShadow: AppShadows.small,
      ),
      child: Stack(
        children: [
          Center(
            child: Icon(icon, color: AppColors.primaryBlue, size: 22),
          ),
          if (hasNotification)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.errorRed,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppDimensions.xxl,
        AppDimensions.xl,
        AppDimensions.xxl,
        0,
      ),
      child: CustomSearchBar(
        hintText: AppStrings.whereTo,
        readOnly: true,
        onTap: () => Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const SearchScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, -0.5),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOutCubic,
                )),
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildAdBanner() {
    final List<Map<String, String>> banners = [
      {
        'title': 'ZERO TRANS',
        'subtitle': 'Safe & Fast Bus Travel',
        'gradient_start': '0xFF1E40AF',
        'gradient_end': '0xFF3B82F6',
      },
      {
        'title': 'Book Your Ride',
        'subtitle': 'Flat 30% OFF on First Trip',
        'gradient_start': '0xFF0F172A',
        'gradient_end': '0xFF1E3A5F',
      },
      {
        'title': 'Weekend Special',
        'subtitle': 'Travel More, Pay Less',
        'gradient_start': '0xFF1E3A5F',
        'gradient_end': '0xFF38BDF8',
      },
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppDimensions.xxl,
        AppDimensions.xl,
        AppDimensions.xxl,
        0,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 180,
            child: PageView.builder(
              controller: _bannerController,
              itemCount: banners.length,
              onPageChanged: (index) => setState(() => _currentBanner = index),
              itemBuilder: (context, index) {
                final banner = banners[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(int.parse(banner['gradient_start']!)),
                        Color(int.parse(banner['gradient_end']!)),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(AppDimensions.radiusXxl),
                    boxShadow: AppShadows.blue,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: -20,
                        bottom: -20,
                        child: Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(0.08),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Positioned(
                        right: -40,
                        top: -30,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(0.05),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(AppDimensions.xl),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              banner['title']!,
                              style: const TextStyle(
                                fontSize: AppDimensions.fontSizeXxxl,
                                fontWeight: FontWeight.w800,
                                color: AppColors.white,
                                height: 1.1,
                              ),
                            ),
                            const SizedBox(height: AppDimensions.sm),
                            Text(
                              banner['subtitle']!,
                              style: TextStyle(
                                fontSize: AppDimensions.fontSizeMd,
                                color: AppColors.white.withOpacity(0.85),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: AppDimensions.lg),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppDimensions.lg,
                                vertical: AppDimensions.sm,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
                              ),
                              child: const Text(
                                'Learn More',
                                style: TextStyle(
                                  fontSize: AppDimensions.fontSizeSm,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryBlue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: AppDimensions.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              banners.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: _currentBanner == index ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  gradient: _currentBanner == index ? AppColors.primaryGradient : null,
                  color: _currentBanner == index ? null : AppColors.lightBlue,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransportCategories(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(
            AppDimensions.xxl,
            AppDimensions.xl,
            AppDimensions.xxl,
            0,
          ),
          child: Text(
            'Transport Options',
            style: TextStyle(
              fontSize: AppDimensions.fontSizeXl,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.md),
        SizedBox(
          height: 100,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: AppDimensions.xxl),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: TransportCategory.defaults.length,
            separatorBuilder: (_, __) => const SizedBox(width: AppDimensions.sm),
            itemBuilder: (context, index) {
              final category = TransportCategory.defaults[index];
              return TransportCard(
                name: category.name,
                icon: category.icon,
                isSelected: index == 0,
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPopularBus(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(
            AppDimensions.xxl,
            AppDimensions.xl,
            AppDimensions.xxl,
            0,
          ),
          child: Text(
            AppStrings.popularBus,
            style: TextStyle(
              fontSize: AppDimensions.fontSizeXl,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.md),
        SizedBox(
          height: 44,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: AppDimensions.xxl),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: Location.popularDestinations.length,
            separatorBuilder: (_, __) => const SizedBox(width: AppDimensions.sm),
            itemBuilder: (context, index) {
              final dest = Location.popularDestinations[index];
              return DestinationChip(
                name: dest.name,
                icon: dest.icon,
                isSelected: false,
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSpecialOffers(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(
            AppDimensions.xxl,
            AppDimensions.xl,
            AppDimensions.xxl,
            0,
          ),
          child: Text(
            AppStrings.specialOffers,
            style: TextStyle(
              fontSize: AppDimensions.fontSizeXl,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.md),
        SizedBox(
          height: 160,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: AppDimensions.xxl),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: Offer.dummyOffers.length,
            separatorBuilder: (_, __) => const SizedBox(width: AppDimensions.md),
            itemBuilder: (context, index) {
              final offer = Offer.dummyOffers[index];
              return OfferCard(
                title: offer.title,
                description: offer.description,
                discount: offer.discount,
                isNew: offer.isNew,
                onClaim: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
