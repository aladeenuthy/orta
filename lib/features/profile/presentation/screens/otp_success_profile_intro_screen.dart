import 'package:orta/features/features.dart';

class ProfileSetupIntroScreen extends StatelessWidget {
  const ProfileSetupIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.horizontal(16),
          child: Column(
            children: <Widget>[
              AppSpacings.vertical(65),
              Image.asset(
                AppAssets.profileHeader,
                height: 230.0.height,
                fit: BoxFit.contain,
              ),
              AppSpacings.vertical(46),
              Text(
                'Profile Set Up',
                style: context.text.displayMedium?.copyWith(
                  color: AppColors.textColor,
                  fontSize: 24.0.fontSize,
                  fontWeight: FontWeight.w700,
                ),
              ),
              AppSpacings.vertical(16),
              Text(
                'Set up your profile to continue to your dashboard.',
                textAlign: TextAlign.center,
                style: context.text.bodyLarge?.copyWith(
                  color: AppColors.greyDark,
                  fontSize: 13.0.fontSize,
                ),
              ),
              AppSpacings.vertical(60),
              const _IntroItem(
                icon: Icons.person_outline,
                title: 'Personal Information',
              ),
              AppSpacings.vertical(22),
              const _IntroItem(
                icon: Icons.event_available_outlined,
                title: 'Availability Setup',
              ),
              const Spacer(),
              AppButton(
                color: AppColors.primary,
                height: 42,
                borderRadius: BorderRadius.circular(10.0.radius),
                margin: EdgeInsets.zero,
                onPressed: () => AppRouter.toNamed(AppRoutes.profilePersonal),
                child: Text(
                  'Continue',
                  style: context.text.titleMedium?.copyWith(
                    color: AppColors.white,
                    fontSize: 18.0.fontSize,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              AppSpacings.vertical(42),
            ],
          ),
        ),
      ),
    );
  }
}

class _IntroItem extends StatelessWidget {
  const _IntroItem({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68.0.height,
      padding: EdgeInsets.symmetric(horizontal: 28.0.width),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.textColor.withValues(alpha: .08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 21.0.radius,
            backgroundColor: AppColors.ongoingChipBg,
            child: Icon(icon, color: AppColors.primary, size: 24.0.radius),
          ),
          AppSpacings.horizontal(20),
          Text(
            title,
            style: context.text.titleMedium?.copyWith(
              color: AppColors.textColor.withValues(alpha: .82),
              fontSize: 14.0.fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
