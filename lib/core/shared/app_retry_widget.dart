import '../../features/features.dart';

class AppRetryWidget extends StatelessWidget {
  final VoidCallback onRetry;
  final String errorMessage;
  const AppRetryWidget({
    super.key,
    required this.onRetry,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSpacings.vertical(70),
        Center(child: Text(errorMessage, style: context.text.labelMedium)),
        AppSpacings.verticalSpaceMedium(),
        AppButton(
          label: 'Retry',
          textColor: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.0.radius)),
          onPressed: () {
            onRetry();
          },
        ),
      ],
    );
  }
}
