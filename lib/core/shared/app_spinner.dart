import 'package:flutter/cupertino.dart';

import '../resources/app_colors.dart';

class AppSpinner extends StatelessWidget {
  const AppSpinner({super.key, this.size = 30, this.color});

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: CupertinoActivityIndicator(
        radius: size / 2,
        color: color ?? AppColors.primary,
      ),
    );
  }
}
