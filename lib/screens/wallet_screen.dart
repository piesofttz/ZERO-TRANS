import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_strings.dart';
import '../models/models.dart';
import '../providers/providers.dart';
import '../widgets/common_widgets.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final walletProvider = context.watch<WalletProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              _buildBalanceCard(walletProvider.balance),
              _buildQuickActions(context),
              _buildPaymentMethods(walletProvider.paymentMethods),
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
            AppStrings.wallet,
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

  Widget _buildBalanceCard(double balance) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.xxl),
      child: GradientContainer(
        gradient: AppColors.darkGradient,
        padding: const EdgeInsets.all(AppDimensions.xxl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Available Balance',
                  style: TextStyle(
                    fontSize: AppDimensions.fontSizeMd,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.md,
                    vertical: AppDimensions.xs,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.successGreen,
                    borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
                  ),
                  child: const Text(
                    'Active',
                    style: TextStyle(
                      fontSize: AppDimensions.fontSizeXs,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.sm),
            Text(
              'Tsh ${balance.toStringAsFixed(0)}',
              style: const TextStyle(
                fontSize: 40,
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.xl),
            Row(
              children: [
                Expanded(
                  child: GradientButton(
                    text: 'Add Money',
                    onPressed: () {},
                    gradient: const LinearGradient(
                      colors: [AppColors.white, Color(0xFFF1F5F9)],
                    ),
                    height: 44,
                  ),
                ),
                const SizedBox(width: AppDimensions.md),
                Expanded(
                  child: GradientButton(
                    text: 'Withdraw',
                    onPressed: () {},
                    isOutlined: true,
                    height: 44,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.xxl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quick Actions',
            style: TextStyle(
              fontSize: AppDimensions.fontSizeXl,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppDimensions.md),
          Row(
            children: [
              _buildActionItem(Icons.history_rounded, 'History', AppColors.primaryBlue),
              const SizedBox(width: AppDimensions.md),
              _buildActionItem(Icons.local_offer_rounded, 'Offers', AppColors.successGreen),
              const SizedBox(width: AppDimensions.md),
              _buildActionItem(Icons.receipt_long_rounded, 'Bills', AppColors.warningOrange),
              const SizedBox(width: AppDimensions.md),
              _buildActionItem(Icons.card_giftcard_rounded, 'Gift', AppColors.accentBlue),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem(IconData icon, String label, Color color) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: AppDimensions.lg),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
            boxShadow: AppShadows.small,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
                ),
                child: Icon(icon, color: color, size: 22),
              ),
              const SizedBox(height: AppDimensions.sm),
              Text(
                label,
                style: const TextStyle(
                  fontSize: AppDimensions.fontSizeSm,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethods(List<PaymentMethod> methods) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.xxl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Payment Methods',
                style: TextStyle(
                  fontSize: AppDimensions.fontSizeXl,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Add New',
                  style: TextStyle(
                    fontSize: AppDimensions.fontSizeMd,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.md),
          ...methods.map((method) => Padding(
            padding: const EdgeInsets.only(bottom: AppDimensions.md),
            child: Container(
              padding: const EdgeInsets.all(AppDimensions.lg),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppDimensions.radiusXl),
                boxShadow: AppShadows.small,
                border: method.isDefault
                    ? Border.all(color: AppColors.primaryBlue, width: 2)
                    : null,
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
                      _getPaymentIcon(method.type),
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
                          method.name,
                          style: const TextStyle(
                            fontSize: AppDimensions.fontSizeMd,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        if (method.isDefault)
                          const Text(
                            'Default',
                            style: TextStyle(
                              fontSize: AppDimensions.fontSizeSm,
                              color: AppColors.primaryBlue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Radio<String>(
                    value: method.id,
                    groupValue: methods.firstWhere((m) => m.isDefault).id,
                    onChanged: (value) {},
                    activeColor: AppColors.primaryBlue,
                  ),
                ],
              ),
            ),
          )),
          const SizedBox(height: AppDimensions.xxxl),
        ],
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
