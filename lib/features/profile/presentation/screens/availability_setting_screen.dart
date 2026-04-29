import 'package:orta/features/features.dart';

class AvailabilitySettingScreen extends StatefulWidget {
  const AvailabilitySettingScreen({
    super.key,
    this.args = const ProfileFlowArgs(),
  });

  final ProfileFlowArgs args;

  @override
  State<AvailabilitySettingScreen> createState() =>
      _AvailabilitySettingScreenState();
}

class _AvailabilitySettingScreenState extends State<AvailabilitySettingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AvailabilityCubit, AvailabilityState>(
      listener: (BuildContext context, AvailabilityState state) {
        if (state.isError) {
          AppSnacks.error(context, state.errorMessage);
        }
        if (widget.args.editMode && state.saveSucceeded) {
          AppSnacks.success(context, 'Availability updated');
          AppRouter.back();
        }
      },
      builder: (BuildContext context, AvailabilityState state) {
        return AppLoadingOverlay(
          loading: state.isLoading,
          child: Scaffold(
            backgroundColor: AppColors.pageMutedBackground,
            appBar: const OnboardingAppBar(title: 'Availability Setting'),
            body: SafeArea(
              child: Padding(
                padding: AppPaddings.horizontal(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AppSpacings.vertical(28),
                    Text(
                      'When are you available to work?',
                      style: context.text.titleLarge?.copyWith(
                        color: AppColors.textColor,
                        fontSize: 16.0.fontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    AppSpacings.vertical(28),
                    _WeekNavigator(state: state),
                    AppSpacings.vertical(10),
                    Expanded(
                      child: ListView.separated(
                        itemCount: state.weeklySchedule.length,
                        separatorBuilder: (_, _) => AppSpacings.vertical(12),
                        itemBuilder: (BuildContext context, int index) {
                          return _AvailabilityRow(
                            day: state.weeklySchedule[index],
                          );
                        },
                      ),
                    ),
                    if (!widget.args.editMode)
                      const StepDots(activeIndex: 2, count: 3),
                    AppSpacings.vertical(24),
                    AppButton(
                      color: AppColors.primary,
                      height: 42,
                      borderRadius: BorderRadius.circular(10.0.radius),
                      margin: EdgeInsets.zero,
                      onPressed: widget.args.editMode
                          ? context.read<AvailabilityCubit>().saveAvailability
                          : () => AppRouter.toNamed(
                              AppRoutes.availabilityConfirm,
                            ),
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
          ),
        );
      },
    );
  }
}

class _WeekNavigator extends StatelessWidget {
  const _WeekNavigator({required this.state});

  final AvailabilityState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            state.weekLabel,
            style: context.text.titleLarge?.copyWith(
              color: AppColors.textColor,
              fontSize: 16.0.fontSize,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        IconButton(
          onPressed: context.read<AvailabilityCubit>().previousWeek,
          icon: const Icon(Icons.chevron_left),
        ),
        IconButton(
          onPressed: context.read<AvailabilityCubit>().nextWeek,
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}

class _AvailabilityRow extends StatelessWidget {
  const _AvailabilityRow({required this.day});

  final AvailabilityDay day;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76.0.height,
      color: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: 12.0.width),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  DateUtils.shortWeekday(day.day),
                  style: context.text.titleMedium?.copyWith(
                    color: AppColors.textColor,
                    fontSize: 15.0.fontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                AppSpacings.vertical(10),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0.width,
                    vertical: 6.0.height,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.cardBorder),
                    borderRadius: BorderRadius.circular(2.0.radius),
                  ),
                  child: Text(
                    '08:00 AM — 09:00 PM',
                    style: context.text.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 12.0.fontSize,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: day.isAvailable,
            activeColor: AppColors.primary,
            inactiveThumbColor: AppColors.grey,
            inactiveTrackColor: AppColors.white,
            activeTrackColor: AppColors.white,
            trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.selected)) {
                return AppColors.grey;
              }
              return AppColors.grey;
            }),
            onChanged: (_) =>
                context.read<AvailabilityCubit>().toggleDay(day.day),
          ),
        ],
      ),
    );
  }
}
