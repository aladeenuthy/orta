import 'package:orta/features/features.dart';

class AuthSubmitButtonContent extends StatelessWidget {
  const AuthSubmitButtonContent({
    super.key,
    required this.label,
    required this.loading,
  });

  final String label;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return SizedBox(
        width: 18.0.width,
        height: 18.0.height,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
        ),
      );
    }

    return Text(
      label,
      style: context.text.titleMedium?.copyWith(
        color: AppColors.white,
        fontSize: 16.0.fontSize,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
