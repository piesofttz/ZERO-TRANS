import 'package:flutter/material.dart';

import '../themes/app_color.dart';
import '../themes/app_radius.dart';
import '../themes/app_shadow.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(16),
    this.withShadow = true,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final bool withShadow;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: AppRadius.large,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.large,
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: AppRadius.large,
            border: Border.all(color: AppColors.border),
            boxShadow: withShadow ? AppShadows.card : null,
          ),
          child: child,
        ),
      ),
    );
  }
}
