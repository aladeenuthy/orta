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
    final Size screenSize = MediaQuery.sizeOf(context);
    final double snackHeight = 54.0.height;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: backgroundColor,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.fromLTRB(
            16.0.width,
            0,
            16.0.width,
            screenSize.height - snackHeight - 150.0.height,
          ),
        ),
      );
  }
}
