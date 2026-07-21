import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_strings.dart';
import '../models/models.dart';
import '../widgets/common_widgets.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedMethod = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            _buildFareSummary(),
            _buildPaymentMethods(),
            const Spacer(),
            _buildPayButton(),
            const SizedBox(height: AppDimensions.xxl),
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
            AppStrings.paymentMethod,
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

  Widget _buildFareSummary() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.xxl),
      child: GradientContainer(
        gradient: AppColors.darkGradient,
        padding: const EdgeInsets.all(AppDimensions.xl),
        child: Column(
          children: [
            _buildFareRow('Base Fare', 'Tsh 25,000'),
            const SizedBox(height: AppDimensions.sm),
            _buildFareRow('Distance (18.5 km)', 'Tsh 15,500'),
            const SizedBox(height: AppDimensions.sm),
            _buildFareRow('Time (25 min)', 'Tsh 5,000'),
            const SizedBox(height: AppDimensions.sm),
            _buildFareRow('Service Fee', 'Tsh 2,000'),
            const Divider(color: AppColors.white, height: AppDimensions.lg),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Fare',
                  style: TextStyle(
                    fontSize: AppDimensions.fontSizeLg,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
                const Text(
                  'Tsh 47,500',
                  style: TextStyle(
                    fontSize: AppDimensions.fontSizeXxl,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFareRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: AppDimensions.fontSizeMd,
            color: AppColors.white.withOpacity(0.8),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: AppDimensions.fontSizeMd,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethods() {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.xxl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select Payment Method',
            style: TextStyle(
              fontSize: AppDimensions.fontSizeXl,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppDimensions.md),
          ...PaymentMethod.dummyPaymentMethods.map((method) => Padding(
            padding: const EdgeInsets.only(bottom: AppDimensions.md),
            child: GestureDetector(
              onTap: () => setState(() => _selectedMethod = method.id),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(AppDimensions.lg),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusXl),
                  boxShadow: _selectedMethod == method.id ? AppShadows.blue : AppShadows.small,
                  border: _selectedMethod == method.id
                      ? Border.all(color: AppColors.primaryBlue, width: 2)
                      : null,
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: _selectedMethod == method.id
                            ? AppColors.primaryBlue.withOpacity(0.1)
                            : AppColors.lightBlue.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
                      ),
                      child: Icon(
                        _getPaymentIcon(method.type),
                        color: _selectedMethod == method.id
                            ? AppColors.primaryBlue
                            : AppColors.textSecondary,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: AppDimensions.lg),
                    Expanded(
                      child: Text(
                        method.name,
                        style: TextStyle(
                          fontSize: AppDimensions.fontSizeMd,
                          fontWeight: FontWeight.w500,
                          color: _selectedMethod == method.id
                              ? AppColors.primaryBlue
                              : AppColors.textPrimary,
                        ),
                      ),
                    ),
                    if (_selectedMethod == method.id)
                      const Icon(
                        Icons.check_circle_rounded,
                        color: AppColors.primaryBlue,
                        size: 24,
                      ),
                  ],
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildPayButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.xxl),
      child: GradientButton(
        text: 'Pay Tsh 47,500',
        onPressed: () {
          Navigator.pop(context);
        },
        width: double.infinity,
        height: 56,
        icon: Icons.lock_rounded,
      ),
    );
  }

  IconData _getPaymentIcon(String type) {
    switch (type) {
      case 'cash':
        return Icons.money_rounded;
      case 'card':
        return Icons.credit_card_rounded;
      case 'wallet':
        return Icons.account_balance_wallet_rounded;
      default:
        return Icons.payment_rounded;
    }
  }
}
