import '../../features/features.dart';

class AppSnacks {
  const AppSnacks._();

  static void success(BuildContext context, String message) {
    _show(context, message, backgroundColor: AppColors.success);
  }

  static void error(BuildContext context, String message) {
    _show(context, message, backgroundColor: AppColors.alert);
  }

  static void _show(
    BuildContext context,
    String message, {
    required Color backgroundColor,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: backgroundColor,
          behavior: SnackBarBehavior.floating,
        ),
      );
  }
}
