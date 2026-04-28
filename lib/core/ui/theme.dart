import 'package:orta/features/features.dart';

ThemeData appTheme() {
  final base = ThemeData.light();

  final TextTheme textTheme = AppTextStyles.textTheme.apply(
    bodyColor: AppColors.textColor,
    displayColor: AppColors.textColor,
  );

  return base.copyWith(
    scaffoldBackgroundColor: AppColors.appBgColor,
    primaryColor: AppColors.primary,

    splashColor: AppColors.primary.withValues(alpha: .12),

    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      foregroundColor: AppColors.textColor,
    ),

    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: AppColors.secondary,
      onSecondary: Colors.white,
      surface: AppColors.appBgColor,
      onSurface: AppColors.textColor,
      error: Colors.red,
      onError: Colors.white,
    ),

    textTheme: textTheme,
    primaryTextTheme: textTheme,

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.textColor),
      ),
    ),
  );
}

extension TextThemeX on BuildContext {
  TextTheme get text => Theme.of(this).textTheme;
}
