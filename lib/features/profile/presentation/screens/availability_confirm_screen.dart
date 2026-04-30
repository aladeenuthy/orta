import 'package:orta/features/features.dart';

class AvailabilityConfirmScreen extends StatelessWidget {
  const AvailabilityConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AvailabilityCubit, AvailabilityState>(
      listener: (BuildContext context, AvailabilityState state) {
        if (state.isError) {
          AppSnacks.error(context, state.errorMessage);
        }
        if (state.isLoaded) {
          showDialog<void>(
            context: context,
            barrierDismissible: false,

            builder: (_) => const _AvailabilitySuccessDialog(),
          );
        }
      },
      builder: (BuildContext context, AvailabilityState state) {
        return AppLoadingOverlay(
          loading: state.isLoading,
          child: Scaffold(
            backgroundColor: AppColors.white,
            appBar: const OnboardingAppBar(
              title: 'Almost Done!',
              canGoBack: false,
            ),
            body: SafeArea(
              child: Padding(
                padding: AppPaddings.horizontal(16),
                child: AppAnimatedColumn(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    AppSpacings.vertical(70),
                    Image.asset(
                      AppAssets.confirmHeader,
                      height: 230.0.height,
                      fit: BoxFit.contain,
                    ),
                    AppSpacings.vertical(50),
                    Text(
                      'Confirm and Submit',
                      style: context.text.displayMedium?.copyWith(
                        color: AppColors.textColor,
                        fontSize: 26.0.fontSize,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    AppSpacings.vertical(24),
                    Text(
                      'Are you sure you want to submit, you can always adjust your availability in the profile section',
                      textAlign: TextAlign.center,
                      style: context.text.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 14.0.fontSize,
                        height: 1.35,
                      ),
                    ),
                    const Spacer(),
                    AppButton(
                      color: AppColors.primary,
                      height: 42,
                      borderRadius: BorderRadius.circular(10.0.radius),
                      margin: EdgeInsets.zero,
                      onPressed: context
                          .read<AvailabilityCubit>()
                          .saveAvailability,
                      child: Text(
                        'Confirm',
                        style: context.text.titleMedium?.copyWith(
                          color: AppColors.white,
                          fontSize: 18.0.fontSize,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    AppSpacings.vertical(18),
                    TextButton(
                      onPressed: AppRouter.back,
                      child: Text(
                        'Take me back',
                        style: context.text.titleMedium?.copyWith(
                          color: AppColors.primary,
                          fontSize: 18.0.fontSize,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    AppSpacings.vertical(40),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _AvailabilitySuccessDialog extends StatelessWidget {
  const _AvailabilitySuccessDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),

      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0.width,
          vertical: 48.0.height,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircleAvatar(
              radius: 42.0.radius,
              backgroundColor: AppColors.successLight,
              child: Icon(
                Icons.check,
                color: AppColors.white,
                size: 52.0.radius,
              ),
            ),
            AppSpacings.vertical(34),
            Text(
              'Successful!',
              style: context.text.displayMedium?.copyWith(
                color: AppColors.textColor,
                fontSize: 26.0.fontSize,
                fontWeight: FontWeight.w800,
              ),
            ),
            AppSpacings.vertical(18),
            Text(
              'Your account has been successfully created.',
              textAlign: TextAlign.center,
              style: context.text.bodyLarge?.copyWith(
                color: AppColors.textSecondary,
                fontSize: 14.0.fontSize,
              ),
            ),
            AppSpacings.vertical(28),
            AppButton(
              color: AppColors.primary,
              height: 42,
              borderRadius: BorderRadius.circular(8.0.radius),
              margin: EdgeInsets.zero,
              onPressed: () => AppRouter.toCloseAllNamed(AppRoutes.home),
              child: Text(
                'Start exploring shifts',
                style: context.text.titleMedium?.copyWith(
                  color: AppColors.white,
                  fontSize: 18.0.fontSize,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
