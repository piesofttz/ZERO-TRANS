import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_strings.dart';
import '../models/models.dart';
import '../widgets/component_widgets.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildUpcomingBookings(),
                  _buildRideHistory(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
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
            AppStrings.bookings,
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

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppDimensions.xxl),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.lightBlue.withOpacity(0.3),
        borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
          boxShadow: AppShadows.blue,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelColor: AppColors.white,
        unselectedLabelColor: AppColors.textSecondary,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: AppDimensions.fontSizeMd,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: AppDimensions.fontSizeMd,
        ),
        tabs: const [
          Tab(text: 'Upcoming'),
          Tab(text: 'History'),
        ],
      ),
    );
  }

  Widget _buildUpcomingBookings() {
    return ListView.builder(
      padding: const EdgeInsets.all(AppDimensions.xxl),
      physics: const BouncingScrollPhysics(),
      itemCount: Booking.dummyBookings.length,
      itemBuilder: (context, index) {
        final booking = Booking.dummyBookings[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: AppDimensions.lg),
          child: RideCard(
            driverName: booking.driverName,
            vehicleType: booking.vehicleType,
            pickupTime: booking.pickupTime,
            destination: booking.destination,
            status: booking.status,
            estimatedFare: booking.estimatedFare,
            estimatedTime: booking.estimatedTime,
            onTrack: () {},
            onCancel: () {},
          ),
        );
      },
    );
  }

  Widget _buildRideHistory() {
    return ListView.builder(
      padding: const EdgeInsets.all(AppDimensions.xxl),
      physics: const BouncingScrollPhysics(),
      itemCount: Booking.rideHistory.length,
      itemBuilder: (context, index) {
        final booking = Booking.rideHistory[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: AppDimensions.lg),
          child: RideCard(
            driverName: booking.driverName,
            vehicleType: booking.vehicleType,
            pickupTime: booking.pickupTime,
            destination: booking.destination,
            status: booking.status,
            estimatedFare: booking.estimatedFare,
            estimatedTime: booking.estimatedTime,
          ),
        );
      },
    );
  }
}
