import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

class AppSpinner extends StatelessWidget {
  const AppSpinner({
    super.key,
    this.size = 30,
    this.color,
    this.strokeWidth = 2,
  });

  final double size;
  final Color? color;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    final double resolvedSize = size.clamp(0, double.infinity).toDouble();

    return SizedBox.square(
      dimension: resolvedSize,
      child: CircularProgressIndicator.adaptive(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(color ?? AppColors.primary),
      ),
    );
  }
}
